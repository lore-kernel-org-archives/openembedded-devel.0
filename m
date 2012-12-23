Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tmu4m-0002tm-Vn
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 23:31:49 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2631063eaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 14:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yu0DBRK/Nllo29v6mxMhnoL8jbuXrxbsG4TNIngCK24=;
	b=TwYUW61YfNPIT0cxYA/RnoNy/fV2bVN1ZWa0kIlMtwnw0M6foce5xHxB6tIOVtG2cd
	YByMC2tgoSXPAzCHQ4BQEaAwgvaaQyE4QnAAGqEERYvSZT6vqEXve48wx/T81IS3CrJs
	4kq7QWyxHBhlVUkI+vJW2jfw3wyeE1Yi9rGcxT0CtPtJSkTpO7lrI9D/wnjpaXolMpcd
	2ZvlTYtXQDNpbX+F4rP/lKTYfhQaIJhjsgd/qJluXIdwKZcIznJ+x7B51D5nz3P3Aw16
	mdr3z7oI1AG1H9qfaeYYIeRpXPPQJX7fI/1Gdp85l0OaBIy6J4JjYbpe4pJ611x+vlUL
	KVlw==
X-Received: by 10.14.176.66 with SMTP id a42mr50610794eem.34.1356300991794;
	Sun, 23 Dec 2012 14:16:31 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id l3sm37371105eem.14.2012.12.23.14.16.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 14:16:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121223222145.6785dca1@eb-e6520>
Date: Sun, 23 Dec 2012 23:16:31 +0100
Message-Id: <657212B5-E6A0-45F8-AD05-3F99D7DB1B73@dominion.thruhere.net>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
	<20121223154736.3c151ef8@eb-e6520>
	<3DF8EBF7-61B4-4EBB-9C58-D1C63256FEF5@dominion.thruhere.net>
	<20121223195357.5fc91a73@eb-e6520>
	<B7FA4357-A7A1-408A-AF1F-89062AAACF8D@dominion.thruhere.net>
	<20121223222145.6785dca1@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQk98L9HazzwVsZl/iCJHpfSwH1jj29Gsr86jYrQ6GaOG8XSSyM4387xbDltzmrPwPskA1uI
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Multiple .bb files are due to be built which each provide udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 22:31:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 dec. 2012, om 22:21 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Le Sun, 23 Dec 2012 20:36:29 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>>> I'll revert the patch tomorrow (monday)
>>=20
>> So how are you going to fix the upgrade paths? Version downgrades are =
a serious regression as well.
>=20
> upgrade path is not a problem here as builds are borken if we don't
> change a setting in the conf files so I'll revert it so that users
> don't need to change anything to their settings (and that won't
> even break angstrom as the fix is not yet pushed as you stated in your
> answer).

It does break angstrom since the autobuilder does have that change and =
the updated systemd was pushed into the feeds already after meta-oe =
gained the commit.




