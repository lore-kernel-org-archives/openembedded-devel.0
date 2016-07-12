Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A53936067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:23:51 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q8so932195qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=pP+IWJ11AASUDPxvzQh82KA7TV+zWQS3uWxqf9p8pwI=;
	b=clm7zAavjdvkY61xDoIo7DQlT8l+JI5o0grLyv60qCmTVi+bMmcY/tAAgjtyWdzR8d
	+kf55CMvi7VK6HHYoazEH0SP4wPeSBIp5Z4fijfzWADSk9ej+5lfLeUUuPBDuhuD/BcR
	YeX0zMwoLlBWwfahhSlPt2M2tuPd46ujllzzHx1P84q9Phvv607P7i5XyKKxNGqXJlSL
	kcMUA3QJSAckRMb00Ic+eFlcEKV3vxhhUjhZhLXoqFDdF7NpIpKn6pnlbuIYJDsnUHVg
	V/O2QYCOB50z9f4Y23+MnirFmzpHPdIVxT9EwQb8ViN9KJc48sOJboaVFjXahr0TGUHw
	I35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=pP+IWJ11AASUDPxvzQh82KA7TV+zWQS3uWxqf9p8pwI=;
	b=YUF41ZbptfBfeXjc0vMJsJIxtkjC/bQLpggDKEF+wvEt7yLdqwQSVkwsUjFzGWShNm
	WXCzG4F/7IV1gT4jxDDJwKBbLWMfMtZ/o3SSXjSn05E+lor5NVYRsCTcOomcbt2i5SE+
	40UOGjvMaLyZpkK3AvDqiLG1EN4x+debmwyrLuZU1b/TyDBDvccmT7df/kkKRrB0p+L2
	/s6Ay78PZ7EvnYLnZdKzkmkKcMZYiYaHgskgVGPzMWGmZpBR7c1e/yMG9Xkok0pyEbvt
	1TAghhQ+qdn+2yiWOtK/+jIPaYO1L2Z4qRSqzxWyNRLdpAv10R2RG9AGJfBI1DG9q5Pm
	5OZQ==
X-Gm-Message-State: ALyK8tK2iSb4pL/5X1PbSnLj9xSTFfukCZMzTuq4KPr+ViJIXh7ILvJ5xPMFrBEgdKA6tcOGRIUohL23gF+xWA==
X-Received: by 10.55.97.18 with SMTP id v18mr6293891qkb.102.1468365831746;
	Tue, 12 Jul 2016 16:23:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 16:23:22 -0700 (PDT)
In-Reply-To: <36c35de6-8808-cc4a-5868-f9616fb0ec95@gmail.com>
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
	<9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
	<CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
	<36c35de6-8808-cc4a-5868-f9616fb0ec95@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 16:23:22 -0700
Message-ID: <CAMKF1sopO0twm2zWKttP8G2UamUr5H_6wQq-ZqMDsqBenZ1WpQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Jul 2016 23:23:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 10:09 PM, Jacopo Malvestio
<jacopo.malvestio@gmail.com> wrote:
> On 12/07/2016 01:48, Khem Raj wrote:
>> On Mon, Jul 11, 2016 at 3:32 PM, Jacopo Malvestio
>> <jacopo.malvestio@gmail.com> wrote:
>>> Hello All,
>>>
>>> I've created a .bbappend file with:
>>>
>>> CFLAGS_remove =3D "-fno-lifetime-dse"
>>> CXXFLAGS_remove =3D "-fno-lifetime-dse"
>>>
>>> but the do_configure step fail, bitbake -v openjdk-8 log:
>>>
>>> | configure: Current directory is /home/jacopo/yjp/poky/build/tmp/work/=
x86_64-linux/openjdk-8-native/72b05-r0/build.
>>> | configure: Since this is not the source root, configure will output t=
he configuration here
>>> | configure: (as opposed to creating a configuration in <src_root>/buil=
d/<conf-name>).
>>> | configure: However, this directory is not empty. This is not allowed,=
 since it could
>>> | configure: seriously mess up just about everything.
>>> | configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/=
openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
>>> | configure: (or create a new empty directory and cd to it).
>>> | configure: error: Will not continue creating configuration in /home/j=
acopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build
>>> | NOTE: The following config.log files may provide further information.
>>> | NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-nat=
ive/72b05-r0/build/config.log
>>> | ERROR: configure failed
>>> | ERROR: Function failed: do_configure (log file is located at /home/ja=
copo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/lo=
g.do_configure.2980
>>>
>>> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't think =
it's a side effect of the gcc6 patch,  but in your opinion, i forgot someth=
ing?
>>>
>>
>> this is building openjdk-8-native package. So you need to add a
>> bbappend for openjdk-8-native_72b05.bb as well
>
> already done:
>
> =E2=9E=9C  openjdk git:(develop) cat openjdk-8-native_72b05.bbappend
> CFLAGS_remove =3D "-fno-lifetime-dse"
> CXXFLAGS_remove =3D "-fno-lifetime-dse"
>
> openjdk-8 is not a recipe, correct? any suggestion?

Hmm can you revert.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=3D33ddb28a64=
28b02ddcc82d1954ecf27cd426fbb5

>
> thank you. jacob
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

