Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 083877114B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 14:36:12 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id x3so838236qcv.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=nb84z1s3mG3RUfCk3d4p8YBSD6SZsElyt4Gh1tSpoE4=;
	b=pSV4LzR1Mp/M3iKWpk0lcMk3XwLz6W/Th/cq2qSHk/KJP7M7FxkKFf/6ZIxGcJdLYf
	RPGN02ggFD/QFz0sbryFBIa5UJ/pUw59ASspcKRy3FyfrqTczdoRuxHm2JndkYWWKTmv
	uWs1NBnCc2cUU+CRtEKFPRGHhMaKpcDhPx9/Jtec/mrUEceL7omhvSDz6ucKjw1KQba5
	NXWyr612RqKOtv/1HIytUOUShMTtLUX78GN8MBGFsmNnS0Acl9i+X+HmiuxARXpUl7ki
	RvM3aArdTGVE4lMyo5Eg4shJtbhvkPU+hskiSzAuYgOLtXnpsC3VKFrzKNxj4CE+iSSs
	EaWQ==
X-Received: by 10.140.30.2 with SMTP id c2mr7115149qgc.32.1415284572472; Thu,
	06 Nov 2014 06:36:12 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Thu, 6 Nov 2014 06:35:32 -0800 (PST)
In-Reply-To: <e27387e29a0b4a7ea1620837f6507de1@BLUPR05MB037.namprd05.prod.outlook.com>
References: <e27387e29a0b4a7ea1620837f6507de1@BLUPR05MB037.namprd05.prod.outlook.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 6 Nov 2014 14:35:32 +0000
X-Google-Sender-Auth: 6M-ZNI5Z8feBDVNvyPfD6evxP4Y
Message-ID: <CANyK_8eahU+SLTCO_B8GhW3uZVsf-UtGsWSW628uCCPAwpb_og@mail.gmail.com>
To: OE Devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Upgrading files identified as CONFFILES?
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
X-List-Received-Date: Thu, 06 Nov 2014 14:36:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 November 2014 14:06, Bryan Evenson <bevenson@melinkcorp.com> wrote:
> All,
>
> First, please let me know if I should be directing this to a different OE=
/yocto mailing list; I have a hard time figuring out which list is appropri=
ate at times.
>
> I am on poky/dylan and am using NTP on my target system.  I would like to=
 change the configuration for NTP and push out the changes to devices that =
are firmware upgradable.  I made the change and pushed out the upgrade, but=
 I see that ntp.conf did not get changed on at least one of the systems (th=
e first one I checked).  Now I see that ntp.conf is listed under CONFFILES =
in the main ntp recipe (http://www.yoctoproject.org/docs/1.7/mega-manual/me=
ga-manual.html#var-CONFFILES), which explains why it was not upgraded.
>
> First, I want to confirm how the CONFFILES parameter works.  If a file is=
 listed under CONFFILES, is that file never modified during an upgrade or i=
s it only upgraded if it has not been modified (matches the default file fr=
om the previous package version)?  I am using opkg for package management i=
f that makes a difference.
>
> Second, how do I force the NTP configuration to be upgraded?  For my syst=
em, the user has no interface to modify the NTP configuration.  So even tho=
ugh it is a configuration file, in my case I want ntp.conf to always match =
the version provided by the upgraded package.
>
> Thanks,
> Bryan
>

This largely depends on the package manager. I can tell you how opkg
works... If a file is listed in CONFFILES it is backed up before an
update is applied. By default, if a conffile has changed, the new
changes go into a file named "%s-opkg" where %s is the original file
name. If "--force-maintainer" is passed as an argument or the option
"force_maintainer" is set, the new changes overwrite the version in
the file system. In opkg v0.3.0 there will be a new
"--ignore-maintainer" argument and "ignore_maintainer" option to keep
the conffile unmodified but not store the changes in "%s-opkg".

Hope that helps,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

