Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3C36FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:41:53 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id ph11so88997252igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=X+wQ3buA17PUTfBbFOoQ6egd4Kxe2VhAuB35UNy9tRk=;
	b=uZ4k+wFNx+wykC7pD2bIFppU4WidFtHhlCR8vPwwW6vbL+Cxx/Vqt1LEB6H+ogc9QU
	kQUy40KlgAVDrfqI3rsfQiZCsLHBp3Ns3mi1aoDUaGUDVc/0AWJmh2O5x6yC816kUCsO
	QW35+AhsrmuuehrO2iUID5nq1IUhLRxXQ9W6BmHwFwvn1ZgUwTei7nIznxfULJgqVDd/
	XpPYPuNA/GapCjyCcHESlUluXQGLru+l3YrHWD3fHjREeETkoS1PhUXvmiBAYhBQYBbO
	7Qxquzh2yScJYe5XWjKUkGV2FyLODXBFmNX0//bsbX0psDiYUAG0LaEP/akmbw7+Yy3h
	v1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=X+wQ3buA17PUTfBbFOoQ6egd4Kxe2VhAuB35UNy9tRk=;
	b=ccVYRXVJfhVxzEmyq5wHuF2q8inwvISRirMUr0OQ5bMg9R5SsepiH1sIaZcyx7FIU0
	fqiWGi6MAuE5yL4waYhe/c8tB1mJS2GMQ6StbX4ygL/qTP8afvsgppKzmbAEAsWVIaSr
	fdLpDb44l5r9PyyGb9PJM5hulJoFrBfhQX8z9MN4nrAW8FrijtmOQ9cAax3nKkTbk7q5
	WsDVYCBld4nwybWFV7F6JZfHxWujLVUc2y2d3aP/RmhY+08AGMcYrro1yk3HceDMpD2Q
	s7KMAgNFZEKEbibxsepnllFDke5Crd4rTgjsFMjXAQZPbZIRzXtIukOFTOAwdjP/DCAg
	9u+Q==
X-Gm-Message-State: ALoCoQmEqhJXfetPoitHQTbEuO6L5ELNtO86z1BP/2y5GqmOlrnxGp4jjecHjHmRugFGH4Bh7xJN8KspSOkB3dJbWqy1AMxjC2CP2ch28wXfUabzJ1mO+jE=
X-Received: by 10.50.126.8 with SMTP id mu8mr31178104igb.52.1450906914663;
	Wed, 23 Dec 2015 13:41:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 13:41:35 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 21:41:35 +0000
Message-ID: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [RFC] Delete all .la files?
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
X-List-Received-Date: Wed, 23 Dec 2015 21:41:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

So I've just done an oe-core world build with my latest .la-killer class
enabled (
https://github.com/rossburton/meta-ross/blob/master/classes/wipe-la.bbclass)
and the results are pretty good.  Basically this class hooks onto
do_install and simply deletes every *.la file it can find in ${D}, with an
opt-out if required.  .la files can cause rebuild problems if directories
move around and are mostly pointless on Linux anyway, so they can just be
deleted.

One recipe (opensp-native) needs to opt out of the .la deletion as
openjade-native for <redacted> reasons explicitly expects .la files to be
installed.  Some other desktop distros already strip out .la files so I
wouldn't be surprised if there's a patch floating around to solve this.

One recipe fails to build (gcc-sanitizers) as it expects to have built its
own libstdc++ so the recipe just deletes the source and drops in symlinks
to the libraries in the sysroot.  Works, but is nasty.   I could either opt
gcc out of la removal, or improve the fixup to make it actually link to the
installed libraries.  Or, merge the sanitisers into the main gcc recipe, as
I can't recall why they're separate anyway.

Apart from that, my world build was successful.

So in the new year I plan on submitting a renamed version of this class to
oe-core and adding it to INHERIT_DISTRO.  Any comments?

Ross

