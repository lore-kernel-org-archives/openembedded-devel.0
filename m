Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ctaf42@gmail.com>) id 1NeuzT-00050V-Dv
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 19:39:18 +0100
Received: by bwz7 with SMTP id 7so2176912bwz.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=sCnIscDLR0L0DsUIZzWkR5NW6aZqvnIsUyCCSouKMVY=;
	b=CEQ3oUDZwCHV4yLvcArOgltGPPLfbdGtpGrLtbWDHecgWASwkrl3M2gQFR6vXxA03x
	OB+lQaQoyMpoCx0Yar8ve5i2hjD2Fc5+fwkJxfmhzBUb1jTP2jcvEf4MjvXK2pLYaTOj
	EA0Mlg0nVB1FsnQGoK1SVzcy+sboTnaf5Fcsk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gqJOo9qmq1/htE1AkMwi58VO/LTUsEAFKlt9UBnaGqCkAvy/vSkxhIQGO7UEjgwKFB
	q1Luzay4d0veTHHMyyetHGEOsg4YfgfwWQfDcHjxq7mO2c06rCVapL3pVEZYp5A/t51J
	5tRpR1yrv7pUN+EVOn4SMrubTPeQMDqwW3IBE=
MIME-Version: 1.0
Sender: ctaf42@gmail.com
Received: by 10.103.50.15 with SMTP id c15mr3007959muk.35.1265740599175; Tue, 
	09 Feb 2010 10:36:39 -0800 (PST)
In-Reply-To: <18e217241002091006t1482a491o93c3a5dfa8a3ab83@mail.gmail.com>
References: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com> 
	<18e217241002091006t1482a491o93c3a5dfa8a3ab83@mail.gmail.com>
From: Cedric GESTES <goctaf@gmail.com>
Date: Tue, 9 Feb 2010 19:36:19 +0100
X-Google-Sender-Auth: 9c6e39be0be44d8f
Message-ID: <ee0a1e451002091036i9ff6334r46624c99884d0e6c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.215
X-SA-Exim-Mail-From: ctaf42@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 18:39:18 -0000
Content-Type: text/plain; charset=UTF-8

Yes we succeeded but this is far from being optimal in our case.

We have two recipes: opennao-image and nao-initramfs-image.

In opennao-image.bb:

DEPENDS                         = "nao-initramfs-image"
IMAGE_PREPROCESS_COMMAND       += "do_copy_initrd"

do_copy_initrd() {
  install -d  ${IMAGE_ROOTFS}/boot
  install -m  0644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME_RD}
${IMAGE_ROOTFS}/boot/initrd
}


This will do ther trick.

On Tue, Feb 9, 2010 at 7:06 PM, C Michael Sundius <msundius@sundius.com> wrote:
> In otherwords has anyone had any success with making one image depend upon a
> 2nd image?
>
> if you what did you do to make that work.
> mike
>
>
> On Mon, Feb 8, 2010 at 4:37 PM, John Van Horne (vanhorj)
> <vanhorj@cisco.com>wrote:
>
>> The system I'm working on boots up with an initramfs image which
>> contains a very minimal file system. During the boot process, a second
>> file system image, in cramfs format, is mounted and used as the root
>> file system. Does anyone have any experience using OE to build such an
>> image? My approach to this was to have a recipe for the cramfs image and
>> a recipe for the initramfs image, and to list the cramfs image as a
>> dependency of the initramfs recipe. Both of these recipes inherit the
>> image class. However, running bitbake on the initramfs recipe fails
>> because the cramfs do_rootfs and do_deploy_to tasks have not run. After
>> running bitbake with debug info turned on, it seems that the initramfs
>> recipe depends upon the do_populate_stage task of cramfs, but not
>> do_rootfs and do_deploy_to. Could anyone offer any insight into why this
>> is?
>>
>>
>>
>> Thanks
>>
>> -John
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


