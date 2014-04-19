Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 44C2E606D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 02:27:07 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so1952657yha.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 19:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6MvWNugnBECvLem6I+oNmddefMInQNjdc/V+kdAFE+M=;
	b=VDAAouiswznp1UTKBdWt2gSF0bqJlMJbO1TArgLCiOkqM3HauDWM/QIloW5952UNTA
	/M1SMFmaetL9PQIwQanHDQJt0OkjpGwj4QL1zI+8hzOXjVZEkW6SRmMKcvdxhoyTTN3a
	6gMdhVHV8pfxceFK2tGDImo9dRNxOvJTuJ3Un8rW2hjB8iHRAMpLi0QIcVgH7DH/kI0O
	P/JhgnM5J9G8LRd036/sNduvEcqllBx2h+uCs+pn/AY3F4kiT7fe3lWNAXg1AY7Dw4N/
	icEwZlBCZDDODNgaaJMBNehirrl3hAd8nK8ZtgJJJak5J3Suq2Mvdxj+KVb7HbcEidGJ
	aihA==
MIME-Version: 1.0
X-Received: by 10.236.45.69 with SMTP id o45mr6460678yhb.64.1397874428376;
	Fri, 18 Apr 2014 19:27:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 18 Apr 2014 19:27:08 -0700 (PDT)
In-Reply-To: <53389231.2020209@gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
	<1394664760-8615-2-git-send-email-net147@gmail.com>
	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
	<53389231.2020209@gmail.com>
Date: Fri, 18 Apr 2014 23:27:08 -0300
X-Google-Sender-Auth: 5EHQt7KmoWYznnyAnJYLRvST0po
Message-ID: <CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2014 02:27:08 -0000
Content-Type: text/plain; charset=UTF-8

Hello Jonathan,

On Sun, Mar 30, 2014 at 6:52 PM, Jonathan Liu <net147@gmail.com> wrote:
> On 13/03/2014 1:01 PM, Otavio Salvador wrote:
>> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>> This adds the necessary target packages for development with all of the
>>> Qt 5 modules.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>
>> | Computing transaction...error: Can't install
>> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
>> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
>> |
>> | Saving cache...
>> |
>> | WARNING:
>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
>> exit 1 from
>> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
>> ${pkgs_to_install}
>> | DEBUG: Python function do_populate_sdk finished
>> | ERROR: Function failed: populate_sdk_image (log file is located at
>>
>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>>
>> Please fix this and test the combinations of enable/disable features.
>> They seem not well tested.
>>
> It looks like qtwayland is not being built properly in your configration.
>
> Can you provide configuration and steps to reproduce this failure?
> I have not had any luck in reproducing it.

The wayland packages cannot be installed if wayland distro feature is
not available.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

