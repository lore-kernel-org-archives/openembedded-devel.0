Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTHiC-00049p-VH
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 19:38:25 +0100
Received: by ggnh4 with SMTP id h4so1765876ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 10:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lchZtUH0MVoa3CsT4t37YUcdIwokfESes6l9LukLcMI=;
	b=RoB9B1Mq8O9UQp6EBGFEIaGz1L15KHZxDRsuKpXRrJ0vVI+NPBmgyllGtXNHYRsmu5
	hJvU1o9+LuqrGfub26+bHjghGqWhzwu8F33ZzKbaCaP1km/f34UgY4XDAPXIX4mBztqL
	hrhtbLZEIH2u2B9C5Cu1/0zeoiOb75dADEDF8=
Received: by 10.152.104.236 with SMTP id gh12mr15627176lab.49.1322073108116;
	Wed, 23 Nov 2011 10:31:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 10:31:17 -0800 (PST)
In-Reply-To: <1321993163.3365.1.camel@lenovo.internal.reciva.com>
References: <CAMKF1squRxNrL4q__e7p-Vi4eK-TD1kv9DDAviCCEowEFogMAw@mail.gmail.com>
	<1321993163.3365.1.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 10:31:17 -0800
Message-ID: <CAMKF1srbyK1oBi4LirQk7P-8L17zYwEvWCF1LqhC2xJTeuvcfQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-4.6 linaro updates
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
X-List-Received-Date: Wed, 23 Nov 2011 18:38:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2011 at 12:19 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-11-22 at 10:16 -0800, Khem Raj wrote:
>> I have pushed a contrib branch with latest linaro updates for gcc 4.6
>> the tree is here please try it out, I have built
>> systemd-gnome-image/angstrom for all qemu arches
>> successfully but I am looking for more testing help
>>
>> http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/gcc-linaro-update
>
> Do you have any details of what improvements are included in these
> patches?

Mainly vectorization improvements using neon. Additionally some PR
fixes which are on trunk
but not backported yet to 4.6 branch. Finer details are in patch headers

>
> thanks
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


