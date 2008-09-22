Received: from [64.233.170.184] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maurizio.rottin@gmail.com>) id 1KhiAc-0000Sf-8r
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Sep 2008 11:57:30 +0200
Received: by rn-out-0910.google.com with SMTP id j66so431808rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2008 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=osCJ7gxOyDn0IE8dzrbUyszKn1pHXxPCYvCVaAJozwM=;
	b=vZpGwBHv3Ybe5P37y/J1tp6XWo1XA+S23emmJouuxZSN5p0xS3Ge6ZtXx5HbiY3hRJ
	4/0zroTZkg22QEDSLO1DQ6S0Qn4Vx2g6QJedipKiOyZYTKPfuvk/mmj1KNCme1c4h5aF
	6WnHF0EAedetRiefkTo3kUKNOD0/4WeZBlLe0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=wjMc9gLe/5OeU7snV0T/w5+OnXeE9yaHdZihXi8sWZnBwWMTQVsSeRV517rxvMnrGy
	S+BpZlpImZmqib2ne9GtucHXe3JSGdn9e238xTu9iPh4iFuZUMPg5WDuTZ13ERqzokq/
	46uyw3bwVON0XYaFXOwkB3Wr8W3u1UOZenWaY=
Received: by 10.150.220.19 with SMTP id s19mr6993293ybg.101.1222077241984;
	Mon, 22 Sep 2008 02:54:01 -0700 (PDT)
Received: by 10.151.84.13 with HTTP; Mon, 22 Sep 2008 02:54:01 -0700 (PDT)
Message-ID: <e83473390809220254m33a91473ua5f5a10348d2d1b1@mail.gmail.com>
Date: Mon, 22 Sep 2008 11:54:01 +0200
From: "Maurizio Rottin" <maurizio.rottin@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <e83473390809220047j44f077b2kf2a84321cf7a827@mail.gmail.com>
MIME-Version: 1.0
References: <e83473390809220047j44f077b2kf2a84321cf7a827@mail.gmail.com>
Subject: Re: tzdata/tzcode fetch fails, outdated...and compile fails
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
X-List-Received-Date: Mon, 22 Sep 2008 09:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/9/22 Maurizio Rottin <maurizio.rottin@gmail.com>:
> hi,
> i need to compile openntpd, but tzdata and tzcode version 2007 are no
> more on the ftp server.
>
> i did just
> cp /stuff/org.openembedded.dev/packages/tzdata/tzdata_2007k.bb
> /stuff/org.openembedded.dev/packages/tzdata/tzdata_2008f.bb
> cp /stuff/org.openembedded.dev/packages/tzcode/tzcode-native_2007k.bb
> /stuff/org.openembedded.dev/packages/tzcode/tzcode-native_2008e.bb
>
> and since the versions 2008f and 2008e are different, the file
> tzcode-native_2008e.bb must be edited to reflect SRC_URI
> ftp://elsie.nci.nih.gov/pub/tzdata2008f.tar.gz
>
> then if i try to bitbake openntpd i get the following error:

i rebuilt every package and now it works!

then maybe you should add/change the two packages in the three.

cheers,



-- 
mr


