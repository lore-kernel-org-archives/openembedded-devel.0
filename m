Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N10xF-0003Ho-PE
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 18:56:04 +0200
Received: by ey-out-1920.google.com with SMTP id 26so141343eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kjGzgZs3V0866N7XvzuvIFAjPaQeVtk2rs28ucDJi7U=;
	b=UWoIJ4/J4ZXPgeMJcNmMdoL+8EE4dBLR71vIcOKD2tdOXco9kqxlCS73TFXG5VCEU/
	krWplOxmTGsNVLoBoLdBtz4QdOAS0sOcKoJ9pxHEgKW5Q2iqbO2AtJxtv4HwviA4Bvjz
	3fbe+YfdDwv1NHLcloVG3VV1bLA8YFQiKmtl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tCl5knr45z+wp55wIlZnaAPSKCGTPdC6Js9BAVwaeTD11vkl69wlJudf+vqdgr4z81
	BGxfSjXvH9qMI1eYCzS4vjNpTl/3ztV+dTd3FvHak0O869W1/eCyf6pXzigi7yJhVByp
	FawQQAzaKrHzwH1OR5zf3y5/K2tV5PInEhy7c=
MIME-Version: 1.0
Received: by 10.216.90.11 with SMTP id d11mr1411487wef.187.1256230501540; Thu, 
	22 Oct 2009 09:55:01 -0700 (PDT)
In-Reply-To: <70c9a9110910220815h6eeb9653ne3d8d1cda181fbdc@mail.gmail.com>
References: <afb7987a0910200214v11b56177w400fac16a87a09f7@mail.gmail.com>
	<1b712b840910211839y11644cb0qe81084e235b51a93@mail.gmail.com>
	<70c9a9110910220815h6eeb9653ne3d8d1cda181fbdc@mail.gmail.com>
Date: Thu, 22 Oct 2009 18:55:01 +0200
Message-ID: <70c9a9110910220955r7cf00977ibd130186c8694611@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [beagleboard] IGEPv2 with TI DSP codecs and GStreamer
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
X-List-Received-Date: Thu, 22 Oct 2009 16:56:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

>I have them queued on a local branch together with some fixed I need to te=
st before pushing them out.
>You might have noticed the patchwork status of your patches has been updat=
ed :)

Thank you very much Koen.

Regards,

 Enric

2009/10/22 Enric Balletb=C3=B2 i Serra <enric.balletbo@telefonica.net>:
>>I have them queued on a local branch together with some fixed I need to t=
est before pushing them out.
>>You might have noticed the patchwork status of your patches has been upda=
ted :)
>
> Thank you very much Koen.
>
> Regards,
>
> =C2=A0Enric
>
> 2009/10/22 Brijesh Singh <brijesh.ksingh@gmail.com>:
>> Hello,
>>
>>> We have patched the ti-dmai to support the IGEP board and we are
>>> currently using a gstreamer pipe like this:
>>> gst-launch filesrc location=3D/home/root/bak/video/luce.flv !
>>> ffdemux_flv name=3Dd d.video_00 ! TIViddec2 ! TIDmaiVideoSink
>>> It works, but the video playback is very chunky and instable.
>>>
>>
>> I've been using .mp4 from http://www.geekbrief.tv/ and it plays pretty
>> smooth without any issue. =C2=A0Are you using latest svn trunk ?
>>
>> -Brijesh
>>
>> On Tue, Oct 20, 2009 at 4:14 AM, Andrea <serra82@gmail.com> wrote:
>>>
>>> Hi Enric,
>>> I'm working on two IGEPv2 boards we bought through the university of
>>> Urbino (italy). We were able to run the DSP TI codecs on a BeagleBoard
>>> sample with the 2.6.29 kernel from openembedded. But we still have
>>> some problems with the IGEP boards.
>>>
>>> 2009/9/15 Enric Balletb=C3=B2 i Serra <enric.balletbo@telefonica.net>:
>>>> =C2=A0 =C2=A0For now, our more stable version of linux is a 2.6.28.10 =
based kernel
>>>> with several backports from recent releases (like smsc driver, liberta=
s, DSS
>>>> ...). That does not seem to linux-omap recipe present in OE.
>>>
>>> What are the differences between your patched kernel and the one
>>> mentioned above (recipes/linux/linux-omap_2.6.29.bb)?
>>> Which DSS patches have been applied?
>>> Should gstreamer and the DSP TI codecs work as far as you know? Is
>>> there some guide to make it all work or are you still working on it?
>>>
>>> The boot parameters we're using are as following:
>>> bootargs-base=3Dconsole=3DttyS2,115200n8 console=3Dtty0
>>> omapfb.mode=3Ddvi:dvi:800x600MR-24@60 mem=3D99M omapfb.vram=3D0:3M,1:3M=
,2:3M
>>> omapfb.debug=3Dy
>>>
>>> We have patched the ti-dmai to support the IGEP board and we are
>>> currently using a gstreamer pipe like this:
>>> gst-launch filesrc location=3D/home/root/bak/video/luce.flv !
>>> ffdemux_flv name=3Dd d.video_00 ! TIViddec2 ! TIDmaiVideoSink
>>> It works, but the video playback is very chunky and instable.
>>>
>>> --~--~---------~--~----~------------~-------~--~----~
>>> You received this message because you are subscribed to the Google Grou=
ps "Beagle Board" group.
>>> To post to this group, send email to beagleboard@googlegroups.com
>>> To unsubscribe from this group, send email to beagleboard+unsubscribe@g=
ooglegroups.com
>>> For more options, visit this group at http://groups.google.com/group/be=
agleboard?hl=3Den
>>> -~----------~----~----~----~------~----~------~--~---
>>>
>>>
>>
>>
>>
>> --
>> Confusion is always the most honest response.
>>
>


