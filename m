Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AB5B57EE93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7wN0cj3z56;
	Sun, 21 Jul 2019 17:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563723012;
	bh=vYlLvn6qAZjXfMlAAZG9qfj19esAMsFdVe/NWMpXHOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNX/0ASPx7uTeSfDwn6WdqkxraFCKjXOL6EldjshfqvcM8Kl01IRTRICBUj0h+4ad
	v2zUSjJp3F3BTyamw11+5LAsImjPbPOekkKciTE6gUx1s2QnJRqJP0YNkDxlZaHI37
	dzIi/r7xSCrAf2/Kzmn4cIRLrAmaIR1VCe/gMgETg6IhptBuo9f1mwvftbsW7oOPfK
	rb12nSGODOwKde2/q/CKJMijwZ2+c9tnwFwGe9EHR7R7YE2ma0XoTg7DMJQ6casaWT
	ahHFUkT5C951IGN105MHdoj5CPt6Th+dgeSmkS9Pbc1dnmuS1GCtUOVPCBWBUY6VAK
	eHs513YyIvMQ77bVyglbz8OpqRnDlF0mBJEqD1EznnZuFtfGANF3uMtmnTWKTPJY96
	ONlb0jMra+ZV6NOoNqHMHBvN44ccKbiFo8IS0Ld/jEUi3hqzl4YiXUQB9xzqDp4W0c
	ihFN7cq98ibm7Z1wxYVywdGWkXiOyQ8vYM3J1L6krhaw6U2rDbWEOkNFonpbiVisC+
	MB4hluGMIbCCm20jnOsz/YWCRRqhlPWLgRKTstX1hfHnQim+CnalNbENuQMQeSdUo0
	tjqWB/YyIVSRVSglvJVrp5+0sdd/2wHjmfJss0bpWBfIcJRC7fIji8+lBvd611jcYD
	YW2WivszzSogd+Niy/pkMSgQ=
Date: Sun, 21 Jul 2019 18:30:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190721153010.GD5886@localhost>
References: <cover.1563719996.git.akuster808@gmail.com>
	<3e51a60a47132cb24e45a1c87babd65c993c60e5.1563719997.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3e51a60a47132cb24e45a1c87babd65c993c60e5.1563719997.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior] 4/8] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Sun, 21 Jul 2019 15:30:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In master the commit
  oprofile: drop virtual/kernel dependency and switch back to TUNE_PKGARCH
reverted this change and did the correct fix instead.

You could cherry-pick the part of that patch that applies to warrior 
instead of this patch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


