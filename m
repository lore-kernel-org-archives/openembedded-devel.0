Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1POJS5-00030c-Kr
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 01:24:43 +0100
Received: by wwi17 with SMTP id 17so3375653wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 16:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XvoD5X3+7RWQ91H9iOuerJzBJ2yE41iJBkH9Tq5LjCI=;
	b=YBX0Ete9VrXTvcLyRyKFfYl/7U/iqm88wMu5zK9/LaPv9ZgWk3KPHyath1Hd7p2M+e
	XS98mxcWqTjrE+tJ75Hv+tQ5nym+0Z/WabTt2lp7tRS9SxJr6AFlYifvmzP5G8PjnHYO
	ZKLpcfsxgX0UE86zqqNXfFApWs9DW/A901TQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rQ5+uM8TSnU37q96jAUMHRu1oHNr0CxvRhY7yI86HPg1ooPev1r6hSbRlXpvFJnsqa
	IRkHkQRq2P3MmNRnrA0xUmog/76It3Fk3IyadYzaJTFkMQa/S6IUw1n4KggcSO1EDe0e
	O/ZopbfR1UDBfEB9weNiDmEnxgBkMuhzct0BQ=
MIME-Version: 1.0
Received: by 10.227.132.206 with SMTP id c14mr1079325wbt.78.1291335796168;
	Thu, 02 Dec 2010 16:23:16 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Thu, 2 Dec 2010 16:23:16 -0800 (PST)
In-Reply-To: <4CF7A630.5030001@mentor.com>
References: <4CF6E7CE.8090801@gmail.com>
	<4CF7A630.5030001@mentor.com>
Date: Fri, 3 Dec 2010 10:53:16 +1030
Message-ID: <AANLkTimjY7=meA6JrgEfAgQ4ozX_S0fg9r1Ya+_wqt9s@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bind_9.3.6.bb: Don't remove nslookup, it exists in FILES_${PN}-utils.
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
X-List-Received-Date: Fri, 03 Dec 2010 00:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 3 December 2010 00:29, Tom Rini <tom_rini@mentor.com> wrote:
> On 12/01/2010 05:26 PM, Graham Gower wrote:
>>
>> Also fixes the following with uclibc:
>> rm: cannot remove
>> `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/bind-9.3.6-r1/image/usr/bin/nsl=
ookup':
>> No such file or directory
>>
>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>
> Can you please go fixup all of the bind recipes and then add nslookup to
> u-a? =A0Thanks.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I'm happy to fix all the bind recipes, but does it really need to be
added to u-a as well? What other recipe(s) ship this binary?

-Graham


