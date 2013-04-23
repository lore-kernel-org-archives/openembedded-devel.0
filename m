Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UUZMx-0006Qd-T4
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 11:18:36 +0200
Received: by mail-vc0-f181.google.com with SMTP id ia10so356201vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 02:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=/O5AkCUVWSONsT8I+RQvtfG7JbZY9GP9HWOJneAQDNM=;
	b=Z6RoNasoXi16aImFxXu8jib+SHMiZ6P4cIF2OAu3nUODeauOBTvGNh/Zl7hFjHwpMS
	q2PNITbZwVQrSSZFy/wA2ek22zwguhfCOIKXdK2QObtDLvKzDcfvKHMROGn+9ocSpIsA
	5iyivXcp2m3pXzFe3qGMlDNUyDXaMW07rhP2v1Hdf8gincJKqgae8WXdON7FlNk08lh1
	PcWmg0hoL44N5OS8ldmyRR88Annn8AFIhuaCsSaXP8d5uRk2E+SLTmMDP6+f2VpaCSTo
	QFunkKKSdq3KBf+OU3SfJMsDV/Ru1zvPM8FbYxDIm8Xm+qpjaplBLIExx95U8wfwDeND
	RtdA==
MIME-Version: 1.0
X-Received: by 10.220.245.4 with SMTP id ls4mr21520558vcb.17.1366707655199;
	Tue, 23 Apr 2013 02:00:55 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 23 Apr 2013 02:00:55 -0700 (PDT)
In-Reply-To: <1366707335-53174-1-git-send-email-paul@paulbarker.me.uk>
References: <1366707335-53174-1-git-send-email-paul@paulbarker.me.uk>
Date: Tue, 23 Apr 2013 10:00:55 +0100
X-Google-Sender-Auth: ldU1p_rMdCne0nTSTNFWT53mi00
Message-ID: <CANyK_8cMTd4aTzAhHX8V3Zrs6pjZoctEfVr8hLNYJXo1WQUzFw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ttf-inconsolata: fix license name
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
X-List-Received-Date: Tue, 23 Apr 2013 09:18:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 April 2013 09:55, Paul Barker <paul@paulbarker.me.uk> wrote:
> We have "SIL Open Font License" 1.1 in common-licenses as OFL-1.1.
>

There's also a copy of the OFL 1.1 in
meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt as the
bitbake recipe just downloads a single font file. I don't know how to
do this as it goes across layers (not sure if relative paths would
work) but would it be better to replace this with reference to the
file in common-licenses? I realise this is there to satisfy having
something in LIC_FILES_CHKSUM but it isn't doing the intended job as
upstream could update the license and it wouldn't break this checksum.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


