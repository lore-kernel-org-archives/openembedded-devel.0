Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 49D9B65ED6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 00:31:50 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id lf12so100647vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=isLXA1fbIEbplZ7W2s27ddDtPu9i3e02+qVjaoqSOtY=;
	b=h3iiWeOq/ST3oMOTKNWVGk9Ienj/lmxRlwuYHxRVjSZVsA7WtyUsb4s7h82NMHluWu
	IMupfJ2KM2ARUiYQ+SbO5vHBN+1Ja6kIm2epl+Od46ZcIpdhG1DVH2u/2ZczfvggTsgD
	Oo9Cbp3AqQY7TnoymZf4JRGCCafqkrRiDCqqjbd4sF+DGO4iyZV2I0kDviLRupitzH6E
	bdDNNWwPMKgqazmshiJ/4vZiNAkBvPHso4RsWtvKzvPg+YbhOQcK4T8FqogBZTRLwgR8
	tfS21fAVu396yEApJ/3n97CBUHEeGVnF10t0b/ugtvP4KYgixccq9nWXgILI/7VYfq4z
	FKkQ==
MIME-Version: 1.0
X-Received: by 10.58.104.229 with SMTP id gh5mr2395223veb.8.1399336311430;
	Mon, 05 May 2014 17:31:51 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Mon, 5 May 2014 17:31:51 -0700 (PDT)
Date: Mon, 5 May 2014 17:31:51 -0700
Message-ID: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: systemd networking.service masked?
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
X-List-Received-Date: Tue, 06 May 2014 00:31:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello everybody!

I noticed networking.service is masked by default -
http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/systemd/systemd-compat-units.bb?h=master.

I guess I can use the Network Manager to bring up eth0 on boot, but I
rather not.

What's the harm in networking.service?

Thank you,

Adam

