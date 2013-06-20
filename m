Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by mail.openembedded.org (Postfix) with ESMTP id CFF32621B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:19:22 +0000 (UTC)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding;
	b=hGcYtSGvrG4CDFel5Y4P6ThkSROUd+3ohbvXpgc2bgRDxIFokX6VtEEr
	MrroT9hLvBK9qUqpaT9d73ZAJ/Q/0wdj0mBAHh7eEh1Bgr6bvQ5ErwzPe
	BYiQADgy7X5aG031mZTP130PasH/tspTvpVvlzeBDEl2D6sgEpZtVeP8C
	Zg/SprEhYN4MyRaYRi9T0W5TVeu/AvQ0AMG3I6Fm4nCeeLwuFNpokf9zp
	fzIwr9qxc1+2K3tl9irXYHBmlrNel;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=@ts.fujitsu.com; q=dns/txt;
	s=s1536b; t=1371716365; x=1403252365;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=wu7FNNDIpXRQn89003BwzKFqW+koIWGTbUURuJR5jfo=;
	b=oy82MzSYaZsVVuqLCsUyUtCDAmbJKfSAiyuFfw+mYKCxLxLZNIOx0ZMi
	T9nvv41TuINpIOtvd09LNrya5423Ho2XhrYKBJQQypozIm0BI+SnQvhzR
	D/wxe59/GTP0HfWGuMd6WPLd5CwWvbj1CfF62nm7lZsSICqF4GfVx/tf2
	lYzHwsbYlRVFsCEcRzM0ip1WkEaHmDk50qstoW5JqgCNhM8vdbJQQfJqu
	WPF4UlZugPlJiNrif43EfcwPSpROP;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.87,903,1363129200"; d="scan'208";a="150532458"
Received: from unknown (HELO abgdate50u.abg.fsc.net) ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 20 Jun 2013 10:19:22 +0200
X-IronPort-AV: E=Sophos;i="4.87,903,1363129200"; d="scan'208";a="12774564"
Received: from unknown (HELO [192.168.0.34]) ([172.25.162.11])
	by abgdate50u.abg.fsc.net with ESMTP; 20 Jun 2013 10:19:22 +0200
Message-ID: <51C2BB08.50308@ts.fujitsu.com>
Date: Thu, 20 Jun 2013 10:19:20 +0200
From: Cestonaro Thilo <thilo.cestonaro@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130529 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51C2B063.1050804@ts.fujitsu.com>
	<6339585B-94AE-44CA-B029-011D77E86461@gmail.com>
In-Reply-To: <6339585B-94AE-44CA-B029-011D77E86461@gmail.com>
Subject: Re: chromium 29.0.1518.2 for armv7a
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
X-List-Received-Date: Thu, 20 Jun 2013 08:19:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.06.2013 09:37, Khem Raj wrote:
> On Jun 20, 2013, at 12:33 AM, Cestonaro Thilo <thilo.cestonaro@ts.fujit=
su.com> wrote:
>
>> Hey,
>>
>> I'm trying to compile chromium from meta-browser for a armv7a SoC.
>> But it always failed with following error[1]. I fixed this bug with th=
e appended patch and I had to remove
>> the extra cflag "-Wno-error=3Dunused-local-typedefs" from the recipe t=
o get it to compile.
> hmm, which version of gcc are you using ? I use gcc 4.8 here and it com=
piles fine and also runs fine.
my gcc version is 4.5.4 so it might be it.

thx for the comment. I'll try to use a newer one.
>
>> But can someone have a look at the patch and tell why the hell this co=
mpiles and the original code not, please?
>>
>> However the real problem[2] is, that whenever I try to start chromium =
on the armv7a machine, it segills right away. Even --help brings the sigi=
ll :/.
>> I've no idea how to fix such a problem; any comments?
>>
>> Thx.
>>
>> Greetings
>> Thilo
>>
>>
>> 1:
>> --------------------------------------------------------------------
>> + cd /home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.=
2
>> + do_compile
>> + ninja -C /home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0=
=2E1518.2/out/Release chrome
>> ninja: Entering directory `/home/cestonarot/Projects/utc_soc/chromium/=
29/chromium-29.0.1518.2/out/Release'
>> [1/4] CC obj/third_party/webrtc/modules/audio_processing/ns/audio_proc=
essing_neon.nsx_core_neon.o
>> FAILED: arm-magna-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vector=
ize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcor=
tex-a8 -mthumb-interwork -mno-thumb --sysroot=3D/home/cestonarot/Projects=
/utc_soc/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/dm814x-e=
vm -MMD -MF obj/third_party/webrtc/modules/audio_processing/ns/audio_proc=
essing_neon.nsx_core_neon.o.d '-DWEBRTC_SVNREVISION=3D"Unavailable(issue6=
87)"' -D_FILE_OFFSET_BITS=3D64 -DUSE_LINUX_BREAKPAD -DNO_TCMALLOC -DDISAB=
LE_NACL -DCHROMIUM_BUILD -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TUR=
BO=3D1 -DUSE_NSS=3D1 -DUSE_X11=3D1 -DENABLE_ONE_CLICK_SIGNIN -DGTK_DISABL=
E_SINGLE_INCLUDES=3D1 -DENABLE_REMOTING=3D1 -DENABLE_WEBRTC=3D1 -DUSE_PRO=
PRIETARY_CODECS -DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY -DENAB=
LE_INPUT_SPEECH -DENABLE_NOTIFICATIONS -DENABLE_GPU=3D1 -DENABLE_EGLIMAGE=
=3D1 -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DENABLE_PLUGIN_IN=
STALLATION=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE=
_THEMES=3D1 -
>   DENABLE_BACKGROUND=3D1 -DENABLE_AUTOMATION=3D1 -DENABLE_GOOGLE_NOW=3D=
1 -DENABLE_LANGUAGE_DETECTION=3D1 -DENABLE_PRINTING=3D1 -DENABLE_CAPTIVE_=
PORTAL_DETECTION=3D1 -DENABLE_MANAGED_USERS=3D1 -DWEBRTC_CHROMIUM_BUILD -=
DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7 -DWEBRTC_ARCH_ARM_NEON -DWEBRTC_LIN=
UX -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND -=
DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -D_FORTIFY_SOURCE=3D2 -I../../third_part=
y/webrtc -I../../third_party -I../.. -I../../third_party/webrtc/common_au=
dio/resampler/include -I../../third_party/webrtc/common_audio/signal_proc=
essing/include -I../../third_party/webrtc/common_audio/vad/include -fstac=
k-protector --param=3Dssp-buffer-size=3D4 -Werror -pthread -fno-exception=
s -fno-strict-aliasing -Wall -Wno-unused-parameter -Wno-missing-field-ini=
tializers -fvisibility=3Dhidden -pipe -fPIC -mfpu=3Dneon -flax-vector-con=
versions -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Ds=
oftfp -mthumb -O2 -fno-ident -fdata-sections -ffunction-sections   -c ../=
=2E./th
>   ird_party/webrtc/modules/audio_processing/ns/nsx_core_neon.c -o obj/t=
hird_party/webrtc/modules/audio_processing/ns/audio_processing_neon.nsx_c=
ore_neon.o
>> {standard input}: Assembler messages:
>> {standard input}:274: Error: ']' expected -- `vld1.16 {d22},[r9:64]'
>> ninja: build stopped: subcommand failed.
>> --------------------------------------------------------------------
>>
>> 2:
>> --------------------------------------------------------------------
>> bash-4.2$ /usr/bin/gdb /usr/bin/chrome/chrome
>> GNU gdb (GDB) 7.3.1
>> Copyright (C) 2011 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gp=
l.html>
>> This is free software: you are free to change and redistribute it.
>> There is NO WARRANTY, to the extent permitted by law.  Type "show copy=
ing"
>> and "show warranty" for details.
>> This GDB was configured as "arm-magna-linux-gnueabi".
>> For bug reporting instructions, please see:
>> <http://www.gnu.org/software/gdb/bugs/>...
>> Reading symbols from /usr/bin/chrome/chrome...done.
>> (gdb) run
>> Starting program: /usr/bin/chrome/chrome
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>> warning: Unable to find libthread_db matching inferior's thread librar=
y, thread debugging will not be available.
>>
>> Program received signal SIGILL, Illegal instruction.
>> 0x41b09ecc in ___ZNSt6vectorISbItN4base20string16_char_traitsESaItEESa=
IS3_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3__ven=
eer ()
>> (gdb) bt full
>> #0  0x41b09ecc in ___ZNSt6vectorISbItN4base20string16_char_traitsESaIt=
EESaIS3_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3_=
_veneer ()
>> No symbol table info available.
>> #1  0x4298c190 in __libc_csu_init (argc=3D1, argv=3D0xbe8eeb34, envp=3D=
0xbe8eeb3c) at elf-init.c:124
>>         i =3D <optimized out>
>> #2  0x4483553c in __libc_start_main () from /lib/libc.so.6
>> No symbol table info available.
>> #3  0x40318944 in _start ()
>> No symbol table info available.
>> (gdb)
>> --------------------------------------------------------------------
>>
>>
>> <fix-armv7a-compile.patch.gz>_________________________________________=
______
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>



