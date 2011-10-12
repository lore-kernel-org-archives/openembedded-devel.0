Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RDyfE-0000Ta-1Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 15:16:04 +0200
Received: by gyg8 with SMTP id 8so654735gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=WJcXlQxNQunRT82k8rwEXmKLy24d6vd7W4mFFKS57HE=;
	b=V+cHXeNkD379+pVX/BIlTFy8Bixd/UBnCeqd1PKkHhQYAymMq9SnXXqGup7EYRmbRB
	yoF9Hc69JgpLc2YScnN0sbkWVBqkNWAWqp5mpS8jNvSJ055Ua+r3CiMi2T+38p2/ECO8
	Jr07Tn9FYPdnB8iKo6n0xZ+MFLQqgjJe+A3Do=
MIME-Version: 1.0
Received: by 10.236.79.170 with SMTP id i30mr36082648yhe.94.1318425020728;
	Wed, 12 Oct 2011 06:10:20 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.103.146 with HTTP; Wed, 12 Oct 2011 06:10:20 -0700 (PDT)
In-Reply-To: <4E95893C.6050903@mlbassoc.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<4E95893C.6050903@mlbassoc.com>
Date: Wed, 12 Oct 2011 16:10:20 +0300
X-Google-Sender-Auth: dsBQKgVkYRxYgZj-8szNRE0D5z8
Message-ID: <CAObi9r8Vm92XauJ1nh50qBC4uz9OyyfhYSUW0YMdRCsFdOmgbw@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 13:16:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2011 at 3:34 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2011-10-12 06:22, mgundes wrote:
>
>>    Hi,
>>
>>    I think one of the big issue with OE is build time. It does everything
>> for you, so that it takes too much times. I want to minimize build time
>> and
>> realized that OE creates ipkgs for almost every package. If there is a way
>>
>
> Not true.  Only the packages needed to complete your image will be built.
>
> That said, there are some packages which are built (the first time only)
> that
> comprise the build environment and tool chain which takes a lot of time,
> but
> this is only the first time through.
>

What image & target are you building for and what packages are built that
> you
> don't think needed to be built?
>
>
>
     In my tmp/work directroy there are 868 ipk packages which was created
by OE:

$ find -iname *.ipk | wc -l
868

     I use arm based pc7302 chipset and vendor supplied machine and distro
configuration. I use standard filesystem with packages like below in my
rootfs image.

IMAGE_INSTALL +=
"base-files base-files-doc  base-passwd  busybox  bash  mtd-utils
dropbear  ethtool  firmwareupdate  strace  oprofile  kernel-modules
memview
\

  modutils-initscripts modutils pareadback picomon2 picoifapp picofuse ubootenv"

     Of course every needed packages should be built and located into rootfs
filesystem directory.

     "ipk" and "deb" files are used to install target system, right? I mean
If I don't need ipkgs as a developer, it would be nice if there is a way to
prevent ipkg creation steps. As far as I know, OE creates ipk from built
package's files and then use created ipks to create rootfs directory; then
creates image from rootfs directory. I am asking that what about directly
creating a rootfs directory and install built package files to rootfs after
compilation in install tasks. By this way there is no need to create ipkgs?
Am I right?


>  to prevent creation of ipkgs it would be really good for me. In my
>> opinion,
>> it would be fine for other people too since usually rootfs directory is
>> enough and ipkgs are not frequently used directly by developers.
>>
>>    I have asked in freenode oe room but friends said there no way to do
>> that
>> in OE system. If there is no way to do that in current OE, do you plan to
>> add as a feature?
>>
>>    Thanks,
>>
>> Regards
>>
>>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
>

Thanks,
Regards,
-- 
MahmutG

