Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vandana.vuthoo@gmail.com>) id 1Nmk2Z-0004DV-HR
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 09:34:51 +0100
Received: by iwn10 with SMTP id 10so1101057iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 00:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=SID3ntbGVnrkkLm5YrCqvQiWGcEmLuwlLzX1pOjuap8=;
	b=R18HiNhq2nhBC9NuQ81UyScqQeXj70/m7cNGYR2ydKFyGrWdRmmziR5KxzN1L9F66F
	QhZGJDx48VjzrhQ4FmduiUAyFupQqo67Utb04e7pwLH5bIZ40yPvHbbpJOWII2a6ZM14
	NeEwYQBq7+RGAoDLWUhEc0A467wgUts1cfcbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KbmoGHCRYiV4+QsAR1HDURjiaVLkcWYIXzDPwLIZoWuWyduOdYjbe3rmjmIrnvk7eH
	KCYFwKjQ/ElcFBDLLXtqE1PTOF8vta3NrDKAb6DX519WIG1AGxql9+TTe0WzN05pitLh
	1hOdNu+lVRQAyC6IDKUiK22OAJaBNqS3dk+A4=
MIME-Version: 1.0
Received: by 10.231.146.79 with SMTP id g15mr155260ibv.49.1267605115528; Wed, 
	03 Mar 2010 00:31:55 -0800 (PST)
In-Reply-To: <19c1b8a91003030009o2a00101fi3a6991510d57b3a5@mail.gmail.com>
References: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
	<19c1b8a91003022245w4efed14cs61d162040ea36149@mail.gmail.com>
	<2b288bf1003022306r17bb8db6xa4c7e585170b153f@mail.gmail.com>
	<19c1b8a91003030009o2a00101fi3a6991510d57b3a5@mail.gmail.com>
Date: Wed, 3 Mar 2010 14:01:55 +0530
Message-ID: <2b288bf1003030031n129a3655n2d545bc8e848cac5@mail.gmail.com>
From: Vandana Vuthoo <vandana.vuthoo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: vandana.vuthoo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: locale support in OE
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
X-List-Received-Date: Wed, 03 Mar 2010 08:34:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

when I do ROOTFS_POSTPROCESS_COMMAND += 'install_linguas;' in the conf
file, it says command not found


run.do_rootfs.5251: line 483: install_linguas: command not found
NOTE: Task failed:
/home/vandana/25febbuild/tmp/work/intel-atom-z530-mv-linux/default-image-1.0-r0/temp/log.do_rootfs.5251


On 3/3/10, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Mar 2, 2010 at 11:06 PM, Vandana Vuthoo
> <vandana.vuthoo@gmail.com> wrote:
>> I used IMAGE_LINGUAS="en-us", there was a typo in writing the mail
>>
>>
>> On 3/3/10, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Mar 2, 2010 at 8:53 PM, Vandana Vuthoo <vandana.vuthoo@gmail.com>
>>> wrote:
>>>> Hi,
>>>> I need to know how to add diff locale supports in OE, I tried
>>>> IMAGE_LINGAUS but it is not working for me.
>>>
>>> if you used same as above then there is a typo it should be something
>>> like
>>> IMAGE_LINGUAS = "en-us"
>>>
>
> you might want to use bitbake -e  <recipe> | grep "^IMAGE_LINGUAS"
> and see what it is set to
>
>>>
>>>> Regards,
>>>> Vandana
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


