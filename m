Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D41F785A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:28:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2017 08:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; d="scan'208";a="171689810"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.1.2])
	by orsmga005.jf.intel.com with ESMTP; 09 Nov 2017 08:28:54 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Thu, 09 Nov 2017 17:28:53 +0100
Message-ID: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [meta-browser] CFT: Chromium 62 in meta-browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Nov 2017 16:28:55 -0000
Content-Type: text/plain

Hi everyone,

Like I said back in September, I'd like to merge the Chromium recipe
I've been maintaining independently [1] since last year into the
meta-browser layer so that more people can both benefit from it as well
as help maintain it. Currently, the meta-browser recipe is still
tracking Chromium 54 and ozone-wayland with Chromium 53, whereas my
recipe tracks the latest stable releases (it's currently at
62.0.3202.89).

[1] https://github.com/rakuco/meta-crosswalk

I don't want to just copy-paste my recipe into meta-browser in one giant
commit and call it a day though, so in parallel to maintaining my recipe
I've been working on "organically" turning the meta-browser recipe into
something that looks more similar to mine (while also landing a few bug
fixes into my recipe after looking at the meta-browser one). This way,
people can still track the commit history and know why each change was
done the way it was.

I believe this has finally reached a stage where it's ready for public
consumption, hence the CFT:

    https://github.com/rakuco/meta-browser/tree/chromium62

I'd like people to look at my commits and let me know if there's any big
issue that would prevent those changes from landing into meta-browser.
If everything's OK, I'd then start sending the patches to the list (or
pull requests on GitHub, whichever is preferred).

There are 60 new commits in my "chromium62" branch; the majority of them
are clean-ups, bug fixes and adjustments to the recipe. In fact, the
actual update from Chromium 54 to Chromium 62 only happens in the 58th
commit, and the biggest change is actually the move to GN (which I've
done separately and before the Chromium 62 update commit). Compared to
my meta-crosswalk Chromium recipe, the existing changes are mostly just
cosmetic (some variables are defined in different locations, the
available PACKAGECONFIG options are different etc), so it's been tested
on Yocto morty and rocko with GCC 5, 6 and 7.

Possibly controversial issues:
- The ozone-wayland recipe has been removed (this is actually commit
  #1). The ozone-wayland project Intel used to maintain has not been
  maintained in a very long time, and it is impossible to just get it to
  work with Chromium 62. I'd also rather not keep Chromium 53 around
  just because of it due to A) increased maintenance costs 2) we'd be
  shipping an ancient Chromium release with tons of security issues.

- musl support is currently broken. I've sent a few patches upstream
  lately and added a few musl-related changes to the Chromium 62 recipe,
  but getting the code to build requires a lot of time and
  determination, and if we don't have someone actively working with
  upstream it's just going to be an uphill battle that I am not willing
  to take upon myself.

- The 'ignore-lost-context' PACKAGECONFIG knob was removed. The patch
  it required no longer applies cleanly, its context refers a 5-year-old
  discussion and it is not clear if it is still necessary at all.

- It is no longer possible to run Chromium as root. Upstream has done
  some work on this front, and now really requires --no-sandbox to be
  passed on the command line for Chromium to run as root. I'd rather not
  swim against the current here.

- In the future, I'd like to revisit the other PACKAGECONFIG knobs as
  well. In particular, it is not clear to me if 'impl-side-painting' and
  'use-egl' are still needed at all, and I'd like to drop
  'component-build' to simplify the recipe and prevent anyone from using
  this option in production.

