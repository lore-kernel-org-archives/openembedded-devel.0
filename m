Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4Zb6-0000qh-US
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 16:13:13 +0100
Received: by lagw12 with SMTP id w12so4928676lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 07:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.110.6 as permitted sender)
	client-ip=10.152.110.6; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.110.6 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.110.6])
	by 10.152.110.6 with SMTP id hw6mr18769312lab.8.1330959878309 (num_hops
	= 1); Mon, 05 Mar 2012 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iJ5Vb8JzB5DA3TLcRUPLtqeEtWrgnLRtHrcDKy8HziE=;
	b=a++pXRklfv8nwl2vEbD+9v0bFzCIf0dN4odg5sBHHh4GZ0yHL2niKgIoDalr0u+t/a
	UNat89BePmWSgQDx7tzYjgfnZgLm5tH6UtlnPgFUoX0KjCDyg4ifQx6BYVYq03MxZM25
	sUBj/gcIhghX46VEM2cJN/Ya0uASGKs3MtSLLKejW0eveUiUT8Fi8o62/2wnBI3dLIhE
	zMI7thX++/1w9CZgkKWPjC1d6ajlcZLQXU20VlslzW3hefkycZKtqXogm2TxmjgFljvR
	//Z5aApDhGePNLZDQ3gX9tv7QjqLBF4RZRC0J0CiXBE3QvvNKT6O0kK7veDEeprvSqEf
	5IqQ==
MIME-Version: 1.0
Received: by 10.152.110.6 with SMTP id hw6mr15401936lab.8.1330959878248; Mon,
	05 Mar 2012 07:04:38 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Mon, 5 Mar 2012 07:04:38 -0800 (PST)
In-Reply-To: <4F54CEF0.70902@mlbassoc.com>
References: <4F54C8C2.5020003@mlbassoc.com>
	<CALbNGRRNwFXh0Ppwr1JrUWp4TwsJXELVM74OxfpVY=X5NpVU2Q@mail.gmail.com>
	<4F54CEF0.70902@mlbassoc.com>
Date: Mon, 5 Mar 2012 16:04:38 +0100
Message-ID: <CALbNGRQk__t-U0VmHpQ=sXeoCXrjA7vbREFbBYjy-+v2F97a_Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla] Can't access any HTTPS page
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
X-List-Received-Date: Mon, 05 Mar 2012 15:13:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 3:34 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-03-05 07:18, Andreas M=FCller wrote:
>>
>> On Mon, Mar 5, 2012 at 3:08 PM, Gary Thomas<gary@mlbassoc.com> =A0wrote:
>>>
>>> I've added firefox to my platform by adding the meta-mozilla layer
>>> (and it's requirements). =A0To include firefox, all I did was
>>> =A0CORE_EXTRA_IMAGE_INSTALL +=3D "firefox"
>>>
>>> With this setup, firefox works, but not with any SSL page,
>>> e.g. trying to access https://google.com/mail gives me this
>>> error screen:
>>>
>>> Secure Connection Failed
>>> =A0 =A0 =A0 =A0 =A0 An error occurred during a connection to accounts.g=
oogle.com.
>>> =A0 =A0 =A0 security library: memory allocation failure.
>>> =A0 =A0 =A0 (Error code: sec_error_no_memory)
>>>
>>> =A0The page you are trying to view can not be shown because the
>>> authenticity
>>> of the received data could not be verified.
>>> =A0Please contact the website owners to inform them of this problem.
>>> Alternatively, use the command found in the help menu to report this
>>> broken
>>> site.
>>>
>>> Did I miss something? =A0Has anyone else tried this?
>>>
>>> Thanks
>>>
>> Is the time of your system valid ( if I remember right I had similar
>> when system time was unbuffered initial at 01.01.2000 )?
>
>
> Yes, the time is set correctly.
>
AArgh - the system time caused trouble on cookies - other issue sorry.

In midori it helped to install glib-networking ( see meta-oe commit
a56bff13b9d22b608352501fbb3ef124e7147bda ). Maybe this helps for
firefox too?

Andreas


