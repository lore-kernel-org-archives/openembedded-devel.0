Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNsHl-0000xW-K7
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:24:14 +0100
Received: by wyb40 with SMTP id 40so7418313wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PpjHKLy4TciBODOTp51D3zLecb3zRnRmKB4v6w12r8U=;
	b=VAlQN7YVWlu0+6gzGmsQVHgjLaguUe/Z8U2sFt0lInw+3n47jasTTkVLOOqDtwSJuA
	UcnpnGfiy//SVhlsLpDp58JQSqcmh7aLPx+6X4zeGRE4oym/3HwcINgV8wo0xoRxBvCH
	28c9Ka8fjsoHuATsDaFIJO03DdhRTxzQRmYW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=c+j1xVhsf1dFhUImNiyC237ARhUZtE3XiaV2cvEiRUesq3VHrMvit1VOT5qjjMlqTX
	/7h2g+RDLRbtfHs1lJjDKw7/G9hQHQZM0n0U7slwaKVjK73l//FkwRefWcVMk+j6XW8r
	skort45jrdcB5PyW8ExANmMvrj2nJUVIG8pFk=
MIME-Version: 1.0
Received: by 10.227.170.78 with SMTP id c14mr9901145wbz.49.1291231371349; Wed,
	01 Dec 2010 11:22:51 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Wed, 1 Dec 2010 11:22:51 -0800 (PST)
In-Reply-To: <4CF6526C.3090702@cbnco.com>
References: <4CF581EA.2030206@gmail.com>
	<4CF6526C.3090702@cbnco.com>
Date: Thu, 2 Dec 2010 05:52:51 +1030
Message-ID: <AANLkTi=v0oF=A6P_53+dNLfpuRp3HU2-VRMY1h_avLeJ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] procps.inc: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Wed, 01 Dec 2010 19:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 December 2010 00:19, Michael Smith <msmith@cbnco.com> wrote:
> Graham Gower wrote:
>>
>> mv: cannot stat
>> `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/procps-3.2.8-r12.1/image/bin/up=
time':
>> No such file or directory
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> Acked-by: Michael Smith <msmith@cbnco.com>
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0usr/bin=3D${D}${bindir}/ \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0usr/proc/bin=3D${D}${bindir}/ \
>
> Is the trailing "/" needed?

Yes.

>
> Mike
>

-Graham


