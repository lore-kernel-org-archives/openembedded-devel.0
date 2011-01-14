Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PdgpL-0007qK-Ux
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 11:24:16 +0100
Received: by wwi17 with SMTP id 17so2576277wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 02:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=8dBUwbtXL77gYaVjAOTpZ51/MtxICe130q2OVY6hiik=;
	b=KlaFhOS3TgHLfiqi7epr69mF+Q7BfuUCFhkg96czXlmt6Gq4unnjqRD8baI4F/3G24
	PMmaElLS8Y7f8CXpeqqoJlaj+nwKT8HDPefIOGc1cHvFDwrVVc5RKlIL16hsItgRWlka
	MkuCkfxAQ8UTWsKOEsiNp+S8qWaV4wLa+0amU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=srQ/8tp7x+cdoP2FmYB08pvU8FAGp0h9TRR+zXdGcaqgz0ulzDhfwIYoaBisPZlbg0
	twnMMCiyzu6wZU22exe+nowzSfgmJfaN0s3wFTtiGIA9M8pyjTJOG02fD/oWA1z519J4
	Gm0huIcrBal922cSLuj6LRuYKf5HBz4PceQoY=
MIME-Version: 1.0
Received: by 10.227.147.129 with SMTP id l1mr543211wbv.26.1295000622075; Fri,
	14 Jan 2011 02:23:42 -0800 (PST)
Received: by 10.227.13.69 with HTTP; Fri, 14 Jan 2011 02:23:41 -0800 (PST)
In-Reply-To: <4D2FC277.6050708@gmail.com>
References: <4D2F0CAD.8000600@eukrea.com>
	<1294929229-4495-1-git-send-email-eric@eukrea.com>
	<4D2FC277.6050708@gmail.com>
Date: Fri, 14 Jan 2011 11:23:41 +0100
Message-ID: <AANLkTim9PzJGCi9NqTvJnFsegHxpWGLCJxjb7F=BwCw9@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] mtd-utils: add 1.4.1
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
X-List-Received-Date: Fri, 14 Jan 2011 10:24:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 4:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 1/13/2011 6:33 AM, Eric B=E9nard wrote:
>>
>> * latest stable version + a fix to mkubifs.
>> * switch to lzo2
>> * tested to generate ubi rootfs on the host.
>>
>> Signed-off-by: Eric B=E9nard<eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>> ---
>> v2: switch 1.4.1 to lzo2, keep lzo for the older recipes

nice, finally no segfaults in dmesg while building shr-images for
gta01 with small nand :)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


