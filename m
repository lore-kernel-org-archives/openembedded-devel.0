Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B58E0606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 18:03:16 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id r135so7594414vkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 11:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=YERM+BA3Dgsad3pEQ9+peZ7Ne9a12egvi6bcUPP4W+I=;
	b=LgM3M4gNbXSAgFAllf9gvaOHD9rpRMeu/BKR5qCzXT5DjI9TsARaaue8Ke+mDL+Juz
	xJ6kyY3TjN5lX53pNIb5ZU9K7K2QFWgPCUyoANWtT2Fs6EixoFAdJRLyIwH9ms1NG2+/
	LfOhOgvuMhwn8rPkUkvyj/4+I+4NNrUdd14JZNIsU+ABChV0cpAB7NeaDQEBwYtRnw0F
	LNJfrDq8Kih0LSLxvsEvuWQnDOrGTmxg35S+b5NgygDt8dIvsTVn0SW52vu/HPDPRKLX
	FBOji0e0ppQy/Gj3d0Q5aJjIxjZvGIy61I3Nl4bgJOKykMMWs6Rtm/lKIHcQIjuTxypr
	t6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=YERM+BA3Dgsad3pEQ9+peZ7Ne9a12egvi6bcUPP4W+I=;
	b=GE/hXO6EKhy/O6qbZbNd+7mh09qCZmQ7/wiu4LphSSjh/QIH9/kAUCATz4VkJgK7zu
	9VlqScYy6it6hL8vyEwi7pOJQKjtR6V+7yaI6+irjTfslTq/wkoYAZu9ChIMXsESnVQJ
	sizoLZT4p6AoGIqcddhEj3ZAi76K+nrUCyuXLF/kPbYhu0HRP+uhbHZW1CQ1W1DMZrBT
	0ba1/nUdZugVcS1bKX891C2QsRKAU+YTg9I2yA+inCIEkyc3MbKOs0kNg2U4gCHBQjWt
	TlwdUDmK8OCB9hhLucbV4R2S12SXIaHYH2ThhmOa01wZX7eAjT8xxYtgytQ3dHMBKisb
	HzAw==
X-Gm-Message-State: ALyK8tL75T5dp/t0gqIOFXHmk++15gRU+cVjyVJSXwdNJVNLxqv3vxz+LbZ1XII5rh8gkI2t4PnQVYMnEfaiQg==
X-Received: by 10.31.180.5 with SMTP id d5mr5639542vkf.73.1468605796728; Fri,
	15 Jul 2016 11:03:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.51.77 with HTTP; Fri, 15 Jul 2016 11:03:16 -0700 (PDT)
In-Reply-To: <b70dfd66-f630-b95e-59fa-8dc94c50d0aa@gmail.com>
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
	<9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
	<CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
	<36c35de6-8808-cc4a-5868-f9616fb0ec95@gmail.com>
	<CAMKF1sopO0twm2zWKttP8G2UamUr5H_6wQq-ZqMDsqBenZ1WpQ@mail.gmail.com>
	<b70dfd66-f630-b95e-59fa-8dc94c50d0aa@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 15 Jul 2016 12:03:16 -0600
Message-ID: <CACS+7ZSpwDKCRTgVGxMZC8kTCV1zFBj=SGvHmCadbYy0cWJTWw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] gcc 4.8 and openjdk-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 18:03:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 July 2016 at 03:47, Jacopo Malvestio <jacopo.malvestio@gmail.com> wro=
te:
> On 13/07/2016 01:23, Khem Raj wrote:
>> On Mon, Jul 11, 2016 at 10:09 PM, Jacopo Malvestio
>> <jacopo.malvestio@gmail.com> wrote:
>>> On 12/07/2016 01:48, Khem Raj wrote:
>>>> On Mon, Jul 11, 2016 at 3:32 PM, Jacopo Malvestio
>>>> <jacopo.malvestio@gmail.com> wrote:
>>>>> Hello All,
>>>>>
>>>>> I've created a .bbappend file with:
>>>>>
>>>>> CFLAGS_remove =3D "-fno-lifetime-dse"
>>>>> CXXFLAGS_remove =3D "-fno-lifetime-dse"
>>>>>
>>>>> but the do_configure step fail, bitbake -v openjdk-8 log:
>>>>>
>>>>> | configure: Current directory is /home/jacopo/yjp/poky/build/tmp/wor=
k/x86_64-linux/openjdk-8-native/72b05-r0/build.
>>>>> | configure: Since this is not the source root, configure will output=
 the configuration here
>>>>> | configure: (as opposed to creating a configuration in <src_root>/bu=
ild/<conf-name>).
>>>>> | configure: However, this directory is not empty. This is not allowe=
d, since it could
>>>>> | configure: seriously mess up just about everything.
>>>>> | configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linu=
x/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
>>>>> | configure: (or create a new empty directory and cd to it).
>>>>> | configure: error: Will not continue creating configuration in /home=
/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/buil=
d
>>>>> | NOTE: The following config.log files may provide further informatio=
n.
>>>>> | NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-n=
ative/72b05-r0/build/config.log
>>>>> | ERROR: configure failed
>>>>> | ERROR: Function failed: do_configure (log file is located at /home/=
jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/=
log.do_configure.2980
>>>>>
>>>>> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't thin=
k it's a side effect of the gcc6 patch,  but in your opinion, i forgot some=
thing?
>>>>>
>>>>
>>>> this is building openjdk-8-native package. So you need to add a
>>>> bbappend for openjdk-8-native_72b05.bb as well
>>>
>>> already done:
>>>
>>> =E2=9E=9C  openjdk git:(develop) cat openjdk-8-native_72b05.bbappend
>>> CFLAGS_remove =3D "-fno-lifetime-dse"
>>> CXXFLAGS_remove =3D "-fno-lifetime-dse"
>>>
>>> openjdk-8 is not a recipe, correct? any suggestion?
>>
>> Hmm can you revert.
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=3D33ddb28=
a6428b02ddcc82d1954ecf27cd426fbb5
>
> reverted and works...
>
> thank you

Another thing that may be worth trying is this repo:
https://dankm@bitbucket.org/dankm/meta-java.git, in the dankm/wip
branch I have a binary openjdk-8-native recipe. Just set the
PREFERRED_PROVIDER to openjdk-zulu-native.

It's something I only used as a build-time improvement when working on
the target recipes.


>
>>>
>>> thank you. jacob
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

