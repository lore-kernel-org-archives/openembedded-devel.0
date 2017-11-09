Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 89D55785B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 17:08:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2017 09:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; d="scan'208";a="1242101474"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.1.2])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2017 09:08:15 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAP9ODKrE_NpWXKR8mZ=y3pa0A4DLd9a7iLE7dVK1RgoUVK1SuA@mail.gmail.com>
	(Otavio Salvador's message of "Thu, 9 Nov 2017 14:54:39 -0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAP9ODKrE_NpWXKR8mZ=y3pa0A4DLd9a7iLE7dVK1RgoUVK1SuA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Thu, 09 Nov 2017 18:08:15 +0100
Message-ID: <87375nbcsg.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Thu, 09 Nov 2017 17:08:15 -0000
Content-Type: text/plain

Hey Otavio, thanks for the quick response!

Otavio Salvador <otavio.salvador@ossystems.com.br> writes:
> Hello Raphael,
>
>> I'd like people to look at my commits and let me know if there's any big
>> issue that would prevent those changes from landing into meta-browser.
>> If everything's OK, I'd then start sending the patches to the list (or
>> pull requests on GitHub, whichever is preferred).
>
> I went through all the commits, one by one. There are few that might
> need minor adjustments (as for example the removal of cups support
> which should be moved to a PACKAGECONFIG) but in general, they are all
> good. You did a great job making it very granular and well documented
> :-)
>
> I think this is huge enough that using a pull request so we can track
> comments and progress makes sense. Do you mind creating one?
>
> I think we will end picking individual commits on the beginning to
> reduce the delta and keep going until we have the bump done. Do you
> think it is a good way to handle this?

I think that works, and it matches what I originally had in mind:
* Get people to look at the existing commits and raise any objections to
  any major "architectural" issues with the changes.
* Once everyone's on the same page, start sending patches in chunks
  (e.g. all dependency changes in one pull request).
* Once the clean-ups and bug fixes are in, send the big PRs (move to GN
  and update to M62).

I'll start splitting that branch into smaller ones for PRs, but I'll
also wait a little bit for others (such as Jacobo, Trevor and Khem) to
chime in as well.

The only bummer is that I'll be on holidays from 17th November to 8th
December so it may take a little longer than usual for me to get all the
changes landed.

