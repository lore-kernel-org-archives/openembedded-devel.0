Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PO5SZ-0001I5-Rv
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 10:28:16 +0100
Received: by gxk20 with SMTP id 20so4069905gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 01:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AS3zZJQVzWEyFLlsgqRwGVt8t4+I3ovyIKwMwfZrl+c=;
	b=J0XZ0vRiz3vhQwR9/trLy59/bMJqF/Cn8J0iKqX+DXLJlCjG0mHJ6qKtjVz7KmREzN
	+m+kjTMcU9rVthAui+YB34DnggStq43WeRrAvWn4ulgGzwyVv38ydmbkL2ixjXh2eI9Z
	iaFYLOwIZq2YIeOsUVSRMm15lJRxJNTPh5KyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=oDXGWrMWImHzrGw4B598O5+ojdZhr+uwtkh2xHQNUYH80RcvzjWw8cl41QwpoXjl1V
	GBSnJWS7wD4+CzX/WHj/KhY0PUcDrIiokp1kQZqhKK4DCac6oBK9PSH9SQ/7woFoKTMD
	F4QR6wzer4lGM44zNZQj/H137juJROpP2MvV8=
MIME-Version: 1.0
Received: by 10.90.59.4 with SMTP id h4mr907253aga.134.1291282012623; Thu, 02
	Dec 2010 01:26:52 -0800 (PST)
Received: by 10.90.35.11 with HTTP; Thu, 2 Dec 2010 01:26:52 -0800 (PST)
In-Reply-To: <4CF67A98.2010708@gmail.com>
References: <4CF4B540.4020108@cisco.com>
	<4CF67A98.2010708@gmail.com>
Date: Thu, 2 Dec 2010 10:26:52 +0100
Message-ID: <AANLkTimqLt1knQWUZiDEGs4H-kf=o-2o9vRkcwPU4pRZ@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gstreamer not getting populated in file system
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
X-List-Received-Date: Thu, 02 Dec 2010 09:28:17 -0000
Content-Type: text/plain; charset=UTF-8

Hi Harshada,

I've seen the same behavior as you, instead of gst-plugins-base you
need to use gst-plugins-base-meta, and correspondingly all other as
well. During last couple of months gst-plugins-base, .etc. changed
dependency on plugins from DEPENDS to RECOMMENDS.

Hope this helps,
Maksym.

On Wed, Dec 1, 2010 at 5:40 PM, Tim Harvey <harvey.tim@gmail.com> wrote:
> On 11/30/2010 12:26 AM, harshada wrote:
>>
>> We created new image by adding following into minimal-image.bb:
>> gstreamer \
>> gst-plugins-base \
>> gst-plugins-good \
>> gst-plugins-bad \
>> gst-plugins-ugly
>> Image is getting built without any compiling issues. But we are not able
>> to find required
>> gstreamer plugins in the file system image. In ipk directory, we could
>> find all of the corresponding ipks.
>> What to do to get the filesystem populated with these gstreamer plugins?
>>
>> thanks and regards,
>> Harshada
>
> I believe you need to place the actual plugins in your image - do a find
> tmp/deploy/ipk -name gst-plugin-*
>
> Tim
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


