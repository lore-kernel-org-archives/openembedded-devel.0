Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE3273D43
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 04:23:55 +0000 (UTC)
Received: by oblw8 with SMTP id w8so60511638obl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 21:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ltzikaHnRD1IbUsy1xTOEZ+wCKO8uKa+pXA5jXLHxgA=;
	b=R4SMUI1AccAawdHIhSrZABib2eWroyYIcXkIjakiq74+72I5xq0l5oV9w2+Vjdnu8i
	ynuC9X733KjPZrnbnlfwGHsXbA+wsv2AlKZbjACBiChH2PROsLB4qTeYh1YxA2Q8PN2S
	qTX1dFoZj1Z2BCutLuFAPVO1ZqZCVlCJZt+s3RcHIxsZvlbpqyEk8GjTP/OFumcLyStL
	HA+WsQZyM1wPU3ASgckTj39CeAmXPDMJiDlFyMoHWTFEYOKra9lK0UMkxo94f3QAuzaM
	vIPxjqDdWL6HZPcul7RN+fBMhrYMWGcnPwRGrLPaVm8wVPeAGjqj76NZdEj/MAU7r4Tj
	xarg==
MIME-Version: 1.0
X-Received: by 10.43.56.146 with SMTP id wc18mr1593411icb.24.1429244636176;
	Thu, 16 Apr 2015 21:23:56 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Thu, 16 Apr 2015 21:23:55 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Thu, 16 Apr 2015 21:23:55 -0700 (PDT)
In-Reply-To: <BN3PR0501MB1090943C5B3B41A6BF6D49E8BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090943C5B3B41A6BF6D49E8BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
Date: Fri, 17 Apr 2015 00:23:55 -0400
Message-ID: <CAMKF1sojoXmYGEXaNkj8H1Xwk_=CULvV=Dtn2adBuydu2Xbb3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: util-linux: Data file clash for lastb with sysvinit
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
X-List-Received-Date: Fri, 17 Apr 2015 04:23:55 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 16, 2015 11:29 AM, "Bryan Evenson" <bevenson@melinkcorp.com> wrote:
>
> All,
>
> I've been working through several issues in order to get a clean upgrade
and I'm down to my last couple.  I found a conflict between sysvinit and
util-linux that I have no idea how to handle and I'm looking for some
help.  I'm using sysvinit for init and opkg for package management.
>
> I am upgrading a system that is on poky/dylan-1.4.4 up to
poky/dizzy-1.7.1.  One of the errors I see during upgrade is the following:
>
> * check_data_file_clashes: Package util-linux wants to install file
/usr/bin/lastb
>         But that file is already provided by package  * sysvinit
>
> The chain I've found for the files on my system are:
> /usr/bin/lastb -> last
> /usr/bin/last -> /usr/bin/last.sysvinit
>
> When I check which package owns lastb ("opkg search /usr/bin/lastb") opkg
says util-linux has that file.  However, I don't see anything in the
util-linux recipe that mentions lastb.  I don't know how this softlink is
getting created or how util-linux is the owner.
>
> Any ideas on how util-linux is getting ownership of lastb and how to
resolve this conflict with sysvinit?

Look for this file in your build  tree it should be clear then who provides
it.
>
> Regards,
> Bryan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

