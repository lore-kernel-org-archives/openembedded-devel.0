Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 98FC46C9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 23:25:25 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i4so3745116oah.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 15:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Yofp3K0Pu8xhwOJjVrbSEQNyId6iNBfU7mUdAM+6rAY=;
	b=j8gzGoaYiPpsuxKh31eZ8MOnIXKlTAcZEVn63J3cMYXii17Z+lYibuqna1r8x/3wwR
	9FI9aInBIQ/1NYLoXnQIjr4WWR1wBQtIaGsRrB/YZsYrWLF/xOE2E+ocJqMXolLIWY57
	HnOLcBu4+vcQmQ6bkVA2Bsi9K1OSfaI2Za931VVPOe19qOqIAQGOmOH/y4lTme1qI0bn
	tWBGMWAWL0DJVuHUmr2TicYMiw7TcSHi+29TT2eed1kDfom9zavRuD3Kthsh7bdQlerB
	gmu6QDXxoxtTak9PXyAKsT7lZqM0YmCYLfgPjK71qfGcCoRbGBEZeR7CI7txY4gZJibR
	NbfA==
X-Gm-Message-State: ALoCoQkQDSgvJGPfFPYnhUNY27SOMgpPIGinvF1zL5YUndf01oDYrl8/RTPYTAYjcvB9HpYPzKsB
X-Received: by 10.182.150.105 with SMTP id uh9mr2977042obb.80.1389914726420;
	Thu, 16 Jan 2014 15:25:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.84.233 with HTTP; Thu, 16 Jan 2014 15:25:06 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 17 Jan 2014 00:25:06 +0100
Message-ID: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: using OE efficiently for development
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
X-List-Received-Date: Thu, 16 Jan 2014 23:25:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi there,

i understand the subject is a bit weird.. i am seeking for advice or
best practices. how would you recommend to deploy OE in a large team
of devs where it is the main 'build' engine for the entire Linux
system which is *being developed*. e.g. the developers are the
'upstream' developer, but the product/system can only be built with
OE.

e.g. an OE build does the right thing from an 'integration'
perspective (fetch from SCM, apply patches, cleanup workspace, ...)
but are there any recommendations or good practices to use OE in a
'development' workflow?

I am familiar with externalsrc of course, but for a very large system
with 100+ recipes this isn't very practical. for the project I am
referring the current/legacy workflow is:

1- checkout all source code required to build the entire system (repo,
gclient, ...)
2- for any development item hack anywhere in any component
3- use a top level 'build script'
4- iterate until code ready, and push to SCM

Basically, that looks like Android development workflow to illustrate even more.

Now, how do we plug OE in such a workflow? any experience with
concrete product development would be very much appreciated.

My initial idea (not implemented, just an idea) was to create a conf
file (or a layer) that has the externalsrc definition for all the
recipes in the layers under development (typically all the proprietary
system bits). the idea is to create a workspace such as:

myproduct
|- oe
|- upstream

and in 'oe' folder put all the recipes, and in 'upstream' all the
source code under development (git clone, svn checkout, ...). the
entire workspace can be checkout with repo/gclient or anything else.

the externsrc variables can point to project in 'upstream' folder such
that switching from 'integration' mode to 'developer' mode would
require to include the conf file.

i am thinking that such a 'developer' pattern must be so common, that
they should be a good solution for it already. of course i am assuming
that doing (large) development in WORKDIR is not very practical, and
that would 'force' a large team of developers to become very familiar
with the inner working of OE (task, clean, rebuild, ..).

any good story to share about how OE is used in such 'developer'
workflow? if we compare to the Android workflow (no troll please!) an
OE workflow is more 'difficult' to grasp, i hope you see what i mean.

More generally, i also curious to discuss other typical developer use
case, such as developing upstream using 'feature branches', ...

thanks

nicolas

