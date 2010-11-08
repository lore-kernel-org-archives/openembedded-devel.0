Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PFZ6m-0000Cr-4t
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 22:18:36 +0100
Received: by ywh1 with SMTP id 1so227055ywh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=txmkIogSaHpIjtLEYO6ivv/rSdGc+QibsLAZWFiK1W8=;
	b=UYlpnigS297xT8pmY8IhiTyha0BbuBHR3KQA3RFXGPKe16f3OL4kdbcMj8SCQcmge6
	pibCpQT+cXJzxPyIp9YjwIGU4jvUzkO6481r8miLJME7CnQpQ6PNdiW5ZlnPXZhj8WOR
	ZEykHHBrPinulkuB0zViI8zbJ981npj+oeLnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=IeyTMiqitBg2OUmzlQwV4+vvU4i85IrdM/MOitgHCpJE5yr5Zox/BnlIrUvUMqWL5E
	XiDeRQG5qLWsvMd11Zb7cAc4A3pbzDvhZXlqbQpnlNbalEQbG8giOidG4m4iQXb+WdTJ
	0e8Qxq9m79bsclnUUf28ItMonh4FlVA8VWqUQ=
Received: by 10.90.57.2 with SMTP id f2mr5820926aga.118.1289251051754; Mon, 08
	Nov 2010 13:17:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 8 Nov 2010 13:17:11 -0800 (PST)
In-Reply-To: <AANLkTinnGqbxaJrF=-6OSJ1N=FsDaAcbvDNuYV5SiA2q@mail.gmail.com>
References: <AANLkTinnGqbxaJrF=-6OSJ1N=FsDaAcbvDNuYV5SiA2q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Nov 2010 13:17:11 -0800
Message-ID: <AANLkTi=eOF8txqPTf1cFU3ffb2CWg_TkeZD0JaRZkSqC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-intermediate-4.5-r18.0+svnr166342 build failure after today's pull
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
X-List-Received-Date: Mon, 08 Nov 2010 21:18:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 8, 2010 at 11:52 AM, Zach Frey <zach@znfrey.com> wrote:
> Hi,
>
> I'm seeing the following failure after updating to latest:
>

this can happen as gcc is build a bit peculiar way just rebuilding gcc
is a bit tricky. You could do something like
bitbake -c clean gcc-cross gcc-cross-initial gcc-cross-intermediate
glibc glibc-initial; bitbake gcc-cross
that should work

Thanks
-Khem


