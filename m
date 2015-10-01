Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC62770A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:17:02 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so17782988igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yVbx9Sa6J3aUnrVmafVFx7m2A4nvywt4j7eSr7idTiQ=;
	b=FV6AdiSyIzkV+iFcPFnP36EZxGwXkCPPTondxVoRvY6ipqmjue8jgWRp5y3fyov8/W
	wyujBwU6kLSdcwYQCUiCFE2SGmD6fO3m/GqqgDPzK1LUM5aJtOFh1vZs8cdXA8jFz/uN
	W5TP1oKD+RXhFQLmKH+C29+97nx0kRxWwSgUjz3JxcLORVdYqNslx3FxXJ7cnvi7qC3w
	8G7AeTXitr8XUyq3W+jPpbj4kMt7F02kcEnhLXx+6G6aX/Q3H9kTqdV7jzBUcHsQ4COI
	JTOsUEmRZvtyWLjKOK4CXoTHJMi2PISVhy23jt1/a2uSZV+wlDl8tAw7tgCdIiw3rtH+
	KOfw==
X-Received: by 10.50.20.67 with SMTP id l3mr2975676ige.75.1443705422926; Thu,
	01 Oct 2015 06:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 06:16:33 -0700 (PDT)
In-Reply-To: <560CFA68.2030208@ni.com>
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
	<394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
	<560CFA68.2030208@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 06:16:33 -0700
Message-ID: <CAMKF1srp+P6xMdDDiDPAMAUJE7=2p_CvmPq4uuAZCi=iCcBj-g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] meta-oe: recipes-devtools: add libubox recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 13:17:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 2:18 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> can they be versioned ?
>>
>
> My initial problem in patch v1 was that I was getting this dev-deps error (I
> used INSANE_SKIP to suppress it):
>
> ERROR: QA Issue: libubox rdepends on libubox-dev [dev-deps]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>
> Martin J. told me to fix the issue properly for these recipes.
>
> Now, in v2, I've made it go away by reordering ${PN} in front of ${PN}-dev
> in PACKAGES and explicitly adding these files to FILES_${PN}. If I use the
> default PACKAGES variable, or do not add the libraries to FILES_${PN}, that
> error reappears.
>
> I don't have a level of knowledge-depth of the OE packaging mechanism to
> fully understand what is happening here and I couldn't find more info in the
> docs... So any help on this is very much appreciated :)

if you were to change the package such that the libraries were using
versioning scheme libfoo.so.X,Y.Z
all your issues will be solved. Since the default packagers would get
invoked with right inputs. Second option is to redefine SOLIBSDEV = ""
and SOLIBS = ".so"

