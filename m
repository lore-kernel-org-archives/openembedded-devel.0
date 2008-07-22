Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KL5lc-0003Eg-3c
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 02:30:13 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1689214rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2008 17:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:message-id; bh=PP5kxpJWTJe0OTZZjZ0I/Oqwe9QxlBOxm90xBSs3F8I=;
	b=gnJtqZo8Clcoq6zfM2kBop6oUO5/HsKliVlj/FAZn2zFF5lLxeZ499OhseIYaf6rl5
	W0gPY+DpBCYYnwZAooQ7Uxi6b1VxIk2Q/c8b2UrDqZeDSzfQggFDWgJVrArJVmWvlV9M
	L8kIvj8HLbqdYH4iopIa7lSVRyb34/8y215aE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:message-id;
	b=mNLh/cjGe6SUt+CFET+NYNVddiydtWIImzGLTRAYiGZvq0SMZy/VokGrJ6NKmVTdjZ
	bHCjhOhF6VdDebsij1yIi3bjgyKjBeMSbBYStuli3YSvE3VMSSjkQj2cvs0o2RKFeziO
	TfiTYy9XlyeRYOpgARTH9zdClcRbM/5lERgQQ=
Received: by 10.115.16.1 with SMTP id t1mr3225681wai.49.1216686547077;
	Mon, 21 Jul 2008 17:29:07 -0700 (PDT)
Received: from isis.localnet ( [71.146.27.134])
	by mx.google.com with ESMTPS id y11sm7159651pod.5.2008.07.21.17.29.00
	(version=SSLv3 cipher=RC4-MD5); Mon, 21 Jul 2008 17:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2008 17:28:58 -0700
User-Agent: KMail/1.10.0 (Linux/2.6.24-19-generic; KDE/4.0.98; i686; ; )
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
In-Reply-To: <c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <488529d2.0b97600a.428e.3313@mx.google.com>
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 00:30:14 -0000
X-Groupsio-MsgNum: 5565
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_LnShIeLF6cxoDw/"

--Boundary-00=_LnShIeLF6cxoDw/
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 16 July 2008 13:43:26 Leon Woestenberg wrote:
> Khem,
> 
> On Wed, Jul 16, 2008 at 10:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> I have not tested it on older compiler/library combinations but I think
> >> it will work there too as I have build various combinations in the past
> >> with same sequence outside OE.
> >>
> >> Comments and feedback is welcome.
> >>
> 
> I will try some combinations over the next few days.
> 
> anyone: This would be a perfect candidate for some good testing
> outside of .dev, what would be the best approach for that currently
> besides the posted patch?
> 
> Excellent work by the way!
> 
> Regards,

I have done some more testing using various toolchain combinations. I could build all gcc 4.x + glibc 2.4+ combos and eglibc as well as uclibc 0.9.28 and uclibc 0.9.29 and uclibc_svn. In this gcc 3.4.4 glibc 2.3.6 was the oldest combination I could  build on x86 with some surgeries.

This is yet another version of the patch with more stuff in it. ( including the fix to build sdk with gcc 4.3.1) 

Unless you folks approve of this patch is going to get bigger and bigger :)

slugOS maintainers confirmed that they do not need the old combo's so I was more concentrating on gcc 4.x and glibc 2.4+ combos.

I would be happy if someone can test it in his scenario and see if the patch has problems.

I have tested arm and x86. I would appreciate other arch builds if possible.

Thanks

-Khem

--Boundary-00=_LnShIeLF6cxoDw/
Content-Type: text/x-patch;
  charset="iso-8859-1";
  name="oe-new-toolchain-build-sequence.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="oe-new-toolchain-build-sequence.patch"

#
# old_revision [7235543953cf5b68de17cb866a0f3ba5dc88ab8e]
#
# delete "packages/eglibc/eglibc-intermediate.inc"
#=20
# delete "packages/eglibc/eglibc-intermediate_svn.bb"
#=20
# delete "packages/glibc/glibc-intermediate.inc"
#=20
# delete "packages/glibc/glibc-intermediate_2.3.2+cvs20040726.bb"
#=20
# delete "packages/glibc/glibc-intermediate_2.3.6.bb"
#=20
# delete "packages/glibc/glibc-intermediate_2.4.bb"
#=20
# delete "packages/glibc/glibc-intermediate_2.5.bb"
#=20
# delete "packages/glibc/glibc-intermediate_2.6.1.bb"
#=20
# delete "packages/glibc/glibc-intermediate_2.7.bb"
#=20
# delete "packages/glibc/glibc-intermediate_cvs.bb"
#=20
# add_dir "packages/glibc/glibc-2.7"
#=20
# add_file "packages/gcc/gcc-3.4.4/gcc-libgcc2-inhibit-libc.patch"
#  content [19c707575d5be816904f4ced86b7450a2e54c9c3]
#=20
# add_file "packages/gcc/gcc-4.3.1/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch"
#  content [8e6d3785dd29dc45cdb795c6a4a1c70b3aa60300]
#=20
# add_file "packages/gcc/gcc-4.3.1/gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patc=
h"
#  content [2cbc3b136ee24e92a85a74d95f62c6efd87f7591]
#=20
# add_file "packages/gcc/gcc-cross-intermediate.inc"
#  content [3fd758b824b19229a3f6e7df95246f0d382bc7ea]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_3.3.3.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_3.3.4.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_3.4.3.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_3.4.4.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.0.2.bb"
#  content [d6632d3d523fcb2d4e71bab2c5a7effd7c819ba5]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.1.0.bb"
#  content [211f0593c75ca9fb9078df3e4a57d18d80e1385f]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.1.1.bb"
#  content [3fc0ba21af09070a730a4b3e0b726ee8918c8f65]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.1.2.bb"
#  content [211f0593c75ca9fb9078df3e4a57d18d80e1385f]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.2.1.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.2.2.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.2.3.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.2.4.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_4.3.1.bb"
#  content [30ce0ad3e7c44f2ebfbeb6ee12d62890fbc34086]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb"
#  content [bdfa3b2a9bb38d911fcba484a8f6a57ab9c6a6d8]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb"
#  content [7ca0df097d7377b3d3e86f9ab60edc17327fc874]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb"
#  content [b41165d11071d72ef03ff2bb5742b410f82555ab]
#=20
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb"
#  content [b41165d11071d72ef03ff2bb5742b410f82555ab]
#=20
# add_file "packages/glibc/files/glibc-2.6.1-use-short-for-fnstsw.patch"
#  content [cd6208674ca556cef23fcfe071a929d4c768e68f]
#=20
# add_file "packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-rai=
se.patch"
#  content [1233a371e51da2cb27c42ec18bc33f11a9288f28]
#=20
# add_file "packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch"
#  content [3cb1771cb1ffb55fd118435cae54bade8a5c7d4e]
#=20
# add_file "packages/glibc/glibc-2.3.6/glibc-cross_sunrpc.patch"
#  content [59253459fc269a11bbb26d9f5e7a42b6871fd287]
#=20
# add_file "packages/glibc/glibc-2.3.6/glibc-memusage.patch"
#  content [2a58393c519f5c0ba7293bdd4643302367f2845d]
#=20
# add_file "packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch"
#  content [f31f3425ae1f8afcb869cd8e0f3c414d01aa211f]
#=20
# add_file "packages/glibc/glibc-2.7/all_glibc-i586-chk.patch"
#  content [5adb32eb0f211aa8fca2fcb25d68b7dbbce3d121]
#=20
# patch "conf/distro/angstrom-2008.1.conf"
#  from [f64ebcf55e85b504d3be169befac3c7981aa74d9]
#    to [dd3ab976c49eec5fbb5e9e740aa8dfe99aa64fa6]
#=20
# patch "conf/distro/celinux-test.conf"
#  from [89d7e451fc9af9bf40690f40acee9b8634d4239f]
#    to [1405fee6f781db757cd0819b219abd9f47fc4b93]
#=20
# patch "conf/distro/chinook-compat.conf"
#  from [6792236a4e268fbe64e7adc994afef1224f52c9a]
#    to [19281a425235c6217a5de40204e18655583cf001]
#=20
# patch "conf/distro/gmustix.conf"
#  from [88db2db3032412eac284ef6efa7a4668c79a29b2]
#    to [e5a0ed1602a23b5cbddbee1a07669efa041cd191]
#=20
# patch "conf/distro/include/angstrom-2007-for-openmoko.inc"
#  from [4e926bdf5178cce4d068eeb210aba5adf7982351]
#    to [85b9d88526b7e40205f13f547c01c721f42fa32f]
#=20
# patch "conf/distro/include/angstrom-eglibc.inc"
#  from [e0e7b6758775be96c0a58faecff645b05ef7c3e2]
#    to [e56df3f5a1f620f0dfa7795ff188661bf1524389]
#=20
# patch "conf/distro/include/angstrom-glibc.inc"
#  from [64060b7ace4591e34cd8206bb5cd3ba77c6554d4]
#    to [9a81308293772bcff0ea1b412e0fa3a478a205fe]
#=20
# patch "conf/distro/include/insane-srcrevs.inc"
#  from [e685e3b620d54ebf0b096e4709ed95ca3329b08c]
#    to [cbc144484de6ac4d699d0a609a011f4f1f04d2bf]
#=20
# patch "conf/distro/include/sane-srcrevs.inc"
#  from [3f7f64ecffb3a08b7d6d6b1dcbb873b77c474243]
#    to [fff789e4d1f239ac260c9e3632a3b3e21fac565c]
#=20
# patch "conf/distro/include/slugos.inc"
#  from [9b41afe5f573c4ce71c88ddf2bcda240c4dae42c]
#    to [15ec40d1c8105150bd6e9f5af9d3efa15ffa623d]
#=20
# patch "conf/distro/jlime-donkey.conf"
#  from [fb7ea51917dde4bafa36f1b4a43be01e96610ad6]
#    to [af6cabdd09a5bd6796c790944232bdcb47f2c83b]
#=20
# patch "conf/distro/jlime-henchman.conf"
#  from [40b971ca62e022ba5da642d0dd65e9472369efc9]
#    to [576306734d9284a03e4a2c7d9af7aeab477b903c]
#=20
# patch "conf/distro/jlime-mongo.conf"
#  from [239a9bf19ee598d83ee84d5958a12b71bd7bef47]
#    to [326f98ce35aedb012b0e23bd6d1c4d5364d22c5b]
#=20
# patch "conf/distro/jlime-shrek.conf"
#  from [4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491]
#    to [4960e4997a76b212b2bda2ec3ddab16d81622075]
#=20
# patch "conf/distro/mamona.conf"
#  from [fd683d8ddd62359322234b247211b416f546a004]
#    to [2259bb76e74ceface351ef6266ee9f3284c8e414]
#=20
# patch "conf/distro/minimal.conf"
#  from [3659ec6bf90d9eac32c48e7ac2207b2a8c100d28]
#    to [bb050fd7b97576649bce4f1605b0c122f9cbea02]
#=20
# patch "conf/distro/nylon.conf"
#  from [55b55fd58b093f18dc69ad389287e77c548403ae]
#    to [93b37b27f5a8b665966cdcd8b90187ec5428f2bc]
#=20
# patch "conf/distro/openprotium.conf"
#  from [fa9e89af0f2d1321bd93fb2c08dfc7fa720a7d51]
#    to [982f64d7db8d48f170cd1aa284d266ddbc1030ce]
#=20
# patch "conf/distro/oplinux-uclibc.conf"
#  from [ded77d3149a141de656d62e5c1ed7e161f1e500d]
#    to [af3019dae5fb6717311d042ac2f3114f99cdd50e]
#=20
# patch "conf/distro/oplinux.conf"
#  from [0dbc9a811a5f426f5d3e4ead5a20330b56e51e41]
#    to [007c319d5693215e75c73b455c5c76a0f2465501]
#=20
# patch "conf/distro/sharprom-compatible.conf"
#  from [866d17894061cd031cda619513332fa012433fa3]
#    to [89b78178c717a75e6dc950636c6903fbfb6fb989]
#=20
# patch "conf/distro/ucslugc.conf"
#  from [13de2c9a77700ae97b0f7a3dbb79971cb6451ca6]
#    to [bb32cc5c8cbf8d2446f2bf2eef140a2ccd04ee1d]
#=20
# patch "conf/distro/unslung.conf"
#  from [0ef6d906a67568b77e1f68fc1ac5c65f65586c67]
#    to [a7d66feda58ef5de37cbaf33395cb0dd4e1e7586]
#=20
# patch "conf/distro/wrt54oe.conf"
#  from [9d556281a94a6474ec9b7e6edffabcecd876b083]
#    to [511263e0f8d97edcbcab96283a7c703b27f7072b]
#=20
# patch "conf/local.conf.sample"
#  from [fa7f5ad0f812c943367b2c88b4e4f7165797959d]
#    to [5164ed855456a3c58975fcfbad1c9da8dd8d60f2]
#=20
# patch "conf/machine/native.conf"
#  from [9f73a28ea65b27265df3e4afa2107401f9463ead]
#    to [e4b8c17ba26581950b67bf9e306d9f1664c0741f]
#=20
# patch "packages/eglibc/eglibc-initial.inc"
#  from [9cc9a816e903fd588bfe9b6529f690d24297a54b]
#    to [4b2b73384f3c8f940e42387057da88a76435f44c]
#=20
# patch "packages/eglibc/eglibc.inc"
#  from [20ecb0b8894a6fa79214db154c8cd4e8458d7237]
#    to [eef22ba34145bef9522d66a4eb30da587ba3e6a2]
#=20
# patch "packages/gcc/gcc-3.4.4.inc"
#  from [b6121dbf8fda33791722c94759192ce86145319f]
#    to [db48eb2b8c53c3d57d561258a42cace119a70438]
#=20
# patch "packages/gcc/gcc-4.3.1.inc"
#  from [c95319fe788a145ce0a5aecd6d6c270424e47e03]
#    to [7ee3a1d24f6fe58cc59653a6e65c7e8bcc68a8a7]
#=20
# patch "packages/gcc/gcc-configure-cross.inc"
#  from [703d1979546f41f4a81d5aed72bf335e2bc5c69e]
#    to [4882906171abcb3738dfefb319ad714053c3adbe]
#=20
# patch "packages/gcc/gcc-cross-initial.inc"
#  from [ad4596bca70fbc850a629b1582fafb6479bcb65d]
#    to [6dc1ca2688a86e10d96b345c271514ca7e6b0f1e]
#=20
# patch "packages/gcc/gcc-cross-initial_4.3.1.bb"
#  from [4b22e8ec5d3911ce0553e074354f5ad218d7fce8]
#    to [1aadd72b822c32000450e9ae18faceef0112a99a]
#=20
# patch "packages/glibc/glibc-initial.inc"
#  from [0480105971d23c66b379db96774c07f2a0913989]
#    to [7a1a79ecca0658f29a905c2140d27445a57bad55]
#=20
# patch "packages/glibc/glibc-initial_2.5.bb"
#  from [c87dce64dc313f734e0764420892401b0c7301ee]
#    to [717f9cbf298c7866010b883caec46b01814a1ca4]
#=20
# patch "packages/glibc/glibc-stage.inc"
#  from [8abe1d7d9fd4c34d725a7f26db2110bb66ec3e16]
#    to [9add53332fea43aff1a7efdeba79858facecfc1a]
#=20
# patch "packages/glibc/glibc.inc"
#  from [94a32473f1193137d45da97d6ed786ae9e755094]
#    to [d7da3e08d193524257645bad4468dbb3dd7ed044]
#=20
# patch "packages/glibc/glibc_2.3.6.bb"
#  from [a180c138b01077df8b234264ee6abd46cbf72314]
#    to [7ce57da5312cee1deb44c097867123d097f84146]
#=20
# patch "packages/glibc/glibc_2.5.bb"
#  from [3c1686afff4b72f25b0ee4879fa7df5bed91c6b3]
#    to [330520507426ad66fcbf5a266a8aa5845504a744]
#=20
# patch "packages/glibc/glibc_2.6.1.bb"
#  from [8b5e0d298c84d71b8a15be26527883a393e5483d]
#    to [17745de42ba1ebc4c1d4242154c294e27aa5a73c]
#=20
# patch "packages/glibc/glibc_2.7.bb"
#  from [02c169c2754286db4f842bbe42a680e438defb73]
#    to [73c2cf870a5fd5c6da7625ada47fefdf0948c1be]
#=20
# patch "packages/meta/external-toolchain.bb"
#  from [ebcd8679c393d51824573b5a70c7a071f8521117]
#    to [fe769763ba169fd561e2c5f1153726281afa9952]
#=20
# patch "packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb"
#  from [63c582236d5e631780a864456ba4db4862602a0e]
#    to [8e92e1882cb3bc63515abe5cc42b6577706e118d]
#=20
# patch "packages/uclibc/uclibc-initial_0.9.26.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [a184826f227450c3799472708b38d95c759f1457]
#=20
# patch "packages/uclibc/uclibc-initial_0.9.27.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [bf5a03c0a95f607474c7585a1cdaec562bbb1747]
#=20
# patch "packages/uclibc/uclibc-initial_0.9.28.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [bf5a03c0a95f607474c7585a1cdaec562bbb1747]
#=20
# patch "packages/uclibc/uclibc-initial_0.9.29.bb"
#  from [d9cf01fb4dec69ff1f796d39c9078030982eacca]
#    to [af0ccde83d59f1948f1f2b5f7d4952d4855c58bc]
#=20
# patch "packages/uclibc/uclibc-initial_svn.bb"
#  from [2715cc791b3fdd1b8e62328291e3ef33973bacc0]
#    to [766c264be7d787f2285f02b13a392f43cb2a87d2]
#=20
# patch "packages/uclibc/uclibc.inc"
#  from [48b0ba2e4cff05071b3b812ef0be0861870cd00c]
#    to [4f97a9d058115dbb12ae1c5d047fb84965500a51]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-3.4.4/gcc-libgcc2-inhibit-libc.patch	19c707575d5be8169=
04f4ced86b7450a2e54c9c3
+++ packages/gcc/gcc-3.4.4/gcc-libgcc2-inhibit-libc.patch	19c707575d5be8169=
04f4ced86b7450a2e54c9c3
@@ -0,0 +1,21 @@
+---
+ gcc/config/i386/linux.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: gcc-3.4.4/gcc/config/i386/linux.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-3.4.4.orig/gcc/config/i386/linux.h	2008-07-17 23:40:00.000000000 -=
0700
++++ gcc-3.4.4/gcc/config/i386/linux.h	2008-07-17 23:40:41.000000000 -0700
+@@ -218,6 +218,7 @@ Boston, MA 02111-1307, USA.  */
+ /* Do code reading to identify a signal frame, and set the frame
+    state data appropriately.  See unwind-dw2.c for the structs.  */
+=20
++#ifndef inhibit_libc
+ #ifdef IN_LIBGCC2
+ /* There's no sys/ucontext.h for some (all?) libc1, so no
+    signal-turned-exceptions for them.  There's also no configure-run for
+@@ -282,3 +283,4 @@ Boston, MA 02111-1307, USA.  */
+   } while (0)
+ #endif /* not USE_GNULIBC_1 */
+ #endif /* IN_LIBGCC2 */
++#endif
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-4.3.1/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch	8e6d3785dd=
29dc45cdb795c6a4a1c70b3aa60300
+++ packages/gcc/gcc-4.3.1/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch	8e6d3785dd=
29dc45cdb795c6a4a1c70b3aa60300
@@ -0,0 +1,31 @@
+---
+ configure    |    2 +-
+ configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4.3.1/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/configure.ac	2008-07-21 12:29:18.000000000 -0700
++++ gcc-4.3.1/configure.ac	2008-07-21 12:29:35.000000000 -0700
+@@ -2352,7 +2352,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
+=20
+-FLAGS_FOR_TARGET=3D
++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+Index: gcc-4.3.1/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/configure	2008-07-21 12:29:48.000000000 -0700
++++ gcc-4.3.1/configure	2008-07-21 12:29:59.000000000 -0700
+@@ -5841,7 +5841,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
+=20
+-FLAGS_FOR_TARGET=3D
++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-4.3.1/gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch	2cbc3b=
136ee24e92a85a74d95f62c6efd87f7591
+++ packages/gcc/gcc-4.3.1/gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch	2cbc3b=
136ee24e92a85a74d95f62c6efd87f7591
@@ -0,0 +1,5466 @@
+Before committing, I noticed that PR/32161 was marked as a dup of PR/32009=
, but my previous patch did not fix it.
+
+This alternative patch is better because it lets you just use CFLAGS_FOR_T=
ARGET to set the compilation flags for libgcc. Since bootstrapped target li=
braries are never compiled with the native compiler, it makes little sense =
to use different flags for stage1 and later stages. And it also makes littl=
e sense to use a different variable than CFLAGS_FOR_TARGET.
+
+Other changes I had to do include:
+
+- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to con=
figure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FO=
R_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner th=
is way though.
+
+- passing the right CFLAGS to configure scripts as exported environment va=
riables
+
+I also stopped passing LIBCFLAGS to configure scripts since they are unuse=
d in the whole src tree. And I updated the documentation as H-P reminded me=
 to do.
+
+Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok f=
or 4.3?
+
+Paolo
+
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+        PR bootstrap/32009
+        PR bootstrap/32161
+
+	* configure.ac (CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Compute here.
+	* configure: Regenerate.
+
+	* Makefile.def: Define stage_libcflags for all bootstrap stages.
+	* Makefile.tpl (BOOT_LIBCFLAGS, STAGE2_LIBCFLAGS, STAGE3_LIBCFLAGS,
+	STAGE4_LIBCFLAGS): New.
+	(CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Subst from autoconf, without
+	$(SYSROOT_CFLAGS_FOR_TARGET) and $(DEBUG_PREFIX_CFLAGS_FOR_TARGET).
+	(BASE_TARGET_EXPORTS): Append them here to C{,XX}FLAGS.
+	(EXTRA_TARGET_FLAGS): Append them here to {LIB,}C{,XX}FLAGS.
+	(configure-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags
+	for target modules.  Don't export LIBCFLAGS.
+	(all-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags; pass
+	$(BASE_FLAGS_TO_PASS) where [+args+] was passed, and [+args+] after
+	the overridden CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
+	(invocations of `all'): Replace $(TARGET_FLAGS_TO_PASS) with
+	$(EXTRA_TARGET_FLAGS), $(FLAGS_TO_PASS) with $(EXTRA_HOST_FLAGS).
+	* Makefile.in: Regenerate.
+
+config:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* mh-ppc-darwin (BOOT_CFLAGS): Reenable.
+
+gcc:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* doc/install.texi: Correct references to CFLAGS, replacing them
+	with BOOT_CFLAGS.  Document flags used during bootstrap for
+	target libraries.
+
+
+---
+ Makefile.def         |   24=20
+ Makefile.in          | 1802 +++++++++++++++++++++++++++++++--------------=
------
+ Makefile.tpl         |   57 -
+ config/mh-ppc-darwin |    3=20
+ configure            |   36 -
+ configure.ac         |   32=20
+ gcc/doc/install.texi |   56 -
+ 7 files changed, 1261 insertions(+), 749 deletions(-)
+
+Index: gcc-4.3.1/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/configure.ac	2008-02-01 19:29:30.000000000 -0800
++++ gcc-4.3.1/configure.ac	2008-07-21 10:56:15.000000000 -0700
+@@ -1667,6 +1667,38 @@ AC_ARG_WITH([debug-prefix-map],
+   [DEBUG_PREFIX_CFLAGS_FOR_TARGET=3D])
+ AC_SUBST(DEBUG_PREFIX_CFLAGS_FOR_TARGET)
+=20
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path)=
.
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" =3D x; then
++  CFLAGS_FOR_TARGET=3D$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
++  esac
++fi
++AC_SUBST(CFLAGS_FOR_TARGET)
++
++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
++  esac
++fi
++AC_SUBST(CXXFLAGS_FOR_TARGET)
++
+ # Handle --with-headers=3DXXX.  If the value is not "yes", the contents o=
f
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno ; t=
hen
+Index: gcc-4.3.1/Makefile.def
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/Makefile.def	2007-10-23 08:53:18.000000000 -0700
++++ gcc-4.3.1/Makefile.def	2008-07-21 10:56:15.000000000 -0700
+@@ -511,43 +511,51 @@ bootstrap_stage =3D {
+ 	//   compiler probably has never heard of them.
+ 	stage_configure_flags=3D'--disable-intermodule $(STAGE1_CHECKING) \
+ 	  --disable-coverage --enable-languages=3D"$(STAGE1_LANGUAGES)"' ;
+-	stage_cflags=3D'$(STAGE1_CFLAGS)' ; };
++	stage_cflags=3D'$(STAGE1_CFLAGS)' ;
++	stage_libcflags=3D'$(STAGE1_LIBCFLAGS)' ; };
+ bootstrap_stage =3D {
+ 	id=3D2 ; prev=3D1 ;
+ 	bootstrap_target=3Dbootstrap2 ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D"$(STAGE2_CFLAGS)" ; };
++	stage_cflags=3D"$(STAGE2_CFLAGS)" ;
++	stage_libcflags=3D"$(STAGE2_LIBCFLAGS)" ; };
+ bootstrap_stage =3D {
+ 	id=3Db2g0 ; prev=3D1 ;
+ 	bootstrap_target=3Dbootstrap2-debug ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D"$(STAGE2_CFLAGS) -g0" ; };
++	stage_cflags=3D"$(STAGE2_CFLAGS) -g0" ;
++	stage_libcflags=3D"$(STAGE2_LIBCFLAGS) -g0" ; };
+ bootstrap_stage =3D {
+ 	id=3D3 ; prev=3D2 ; lean=3D1 ;
+ 	compare_target=3Dcompare ;
+ 	bootstrap_target=3Dbootstrap ;
+ 	cleanstrap_target=3Dcleanstrap ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D"$(STAGE3_CFLAGS)" ; };
++	stage_cflags=3D"$(STAGE3_CFLAGS)" ;
++	stage_libcflags=3D"$(STAGE3_LIBCFLAGS)" ; };
+ bootstrap_stage =3D {
+ 	id=3Db3g2 ; prev=3Db2g0 ; lean=3D1 ;
+ 	compare_target=3Dcompare-debug ;
+ 	bootstrap_target=3Dbootstrap-debug ;
+ 	cleanstrap_target=3Dcleanstrap-debug ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D"$(STAGE3_CFLAGS) -g2" ; };
++	stage_cflags=3D"$(STAGE3_CFLAGS) -g2" ;
++	stage_libcflags=3D"$(STAGE3_LIBCFLAGS) -g2" ; };
+ bootstrap_stage =3D {
+ 	id=3D4 ; prev=3D3 ; lean=3D2 ;
+ 	compare_target=3Dcompare3 ;
+ 	bootstrap_target=3Dbootstrap4 ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D"$(STAGE4_CFLAGS)" ; };
++	stage_cflags=3D"$(STAGE4_CFLAGS)" ;
++	stage_libcflags=3D"$(STAGE4_CFLAGS)" ; };
+ bootstrap_stage =3D {
+ 	id=3Dprofile ; prev=3D1 ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D'$(STAGE2_CFLAGS) -fprofile-generate' ; };
++	stage_cflags=3D'$(STAGE2_CFLAGS) -fprofile-generate' ;
++	stage_libcflags=3D'$(STAGE2_LIBCFLAGS) -fprofile-generate' ; };
+ bootstrap_stage =3D {
+ 	id=3Dfeedback ; prev=3Dprofile ;
+ 	bootstrap_target=3Dprofiledbootstrap ;
+ 	stage_configure_flags=3D"@stage2_werror_flag@" ;
+-	stage_cflags=3D'$(STAGE3_CFLAGS) -fprofile-use' ; };
++	stage_cflags=3D'$(STAGE3_CFLAGS) -fprofile-use' ;
++	stage_libcflags=3D'$(STAGE3_LIBCFLAGS) -fprofile-use' ; };
+Index: gcc-4.3.1/Makefile.tpl
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/Makefile.tpl	2008-07-21 10:56:14.000000000 -0700
++++ gcc-4.3.1/Makefile.tpl	2008-07-21 10:56:15.000000000 -0700
+@@ -207,10 +207,10 @@ BASE_TARGET_EXPORTS =3D \
+ 	AR=3D"$(AR_FOR_TARGET)"; export AR; \
+ 	AS=3D"$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC=3D"$(CC_FOR_TARGET)"; export CC; \
+-	CFLAGS=3D"$(CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CFLAGS=3D"$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREF=
IX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS=3D"$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
+-	CXXFLAGS=3D"$(CXXFLAGS_FOR_TARGET)"; export CXXFLAGS; \
++	CXXFLAGS=3D"$(CXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_=
PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS; \
+ 	GCJ=3D"$(GCJ_FOR_TARGET)"; export GCJ; \
+ 	GFORTRAN=3D"$(GFORTRAN_FOR_TARGET)"; export GFORTRAN; \
+ 	DLLTOOL=3D"$(DLLTOOL_FOR_TARGET)"; export DLLTOOL; \
+@@ -330,14 +330,19 @@ PICFLAG =3D=20
+ # MAKEINFO and MAKEINFOFLAGS are explicitly passed here to make them
+ # overrideable (for a bootstrap build stage1 also builds gcc.info).
+=20
+-STAGE1_CFLAGS=3D@stage1_cflags@
+ STAGE1_CHECKING=3D@stage1_checking@
+ STAGE1_LANGUAGES=3D@stage1_languages@
+=20
++STAGE1_CFLAGS=3D@stage1_cflags@
+ STAGE2_CFLAGS=3D$(BOOT_CFLAGS)
+ STAGE3_CFLAGS=3D$(BOOT_CFLAGS)
+ STAGE4_CFLAGS=3D$(BOOT_CFLAGS)
+=20
++STAGE1_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE2_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE3_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE4_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++
+ do-compare =3D @do_compare@
+ do-compare3 =3D $(do-compare)
+ do-compare-debug =3D $(SHELL) $(srcdir)/contrib/compare-debug $$f1 $$f2
+@@ -376,18 +381,11 @@ COMPILER_AS_FOR_TARGET=3D@COMPILER_AS_FOR_
+ COMPILER_LD_FOR_TARGET=3D@COMPILER_LD_FOR_TARGET@
+ COMPILER_NM_FOR_TARGET=3D@COMPILER_NM_FOR_TARGET@
+=20
+-# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
+-# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
+-# might also be empty (or "-g", if a non-GCC C++ compiler is in the path)=
.
+-# We want to ensure that TARGET libraries (which we know are built with
+-# gcc) are built with "-O2 -g", so prepend those options when setting
+-# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET =3D -O2 -g $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) \
+-	$(DEBUG_PREFIX_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET =3D @CFLAGS_FOR_TARGET@
++CXXFLAGS_FOR_TARGET =3D @CXXFLAGS_FOR_TARGET@
+ SYSROOT_CFLAGS_FOR_TARGET =3D @SYSROOT_CFLAGS_FOR_TARGET@
+ DEBUG_PREFIX_CFLAGS_FOR_TARGET =3D @DEBUG_PREFIX_CFLAGS_FOR_TARGET@
+-CXXFLAGS_FOR_TARGET =3D -O2 -g $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) \
+-	$(DEBUG_PREFIX_CFLAGS_FOR_TARGET)
++
+ LIBCFLAGS_FOR_TARGET =3D $(CFLAGS_FOR_TARGET)
+ LIBCXXFLAGS_FOR_TARGET =3D $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
+ LDFLAGS_FOR_TARGET =3D @LDFLAGS@=20
+@@ -491,19 +489,20 @@ POSTSTAGE1_FLAGS_TO_PASS =3D \
+ # Flags to pass down to makes which are built with the target environment=
.
+ # The double $ decreases the length of the command line; those variables
+ # are set in BASE_FLAGS_TO_PASS, and the sub-make will expand them.  The
+-# COMPILER_ prefixed variables are not passed down so we expand them here=
.
++# *_CFLAGS_FOR_TARGET variables are not passed down and most often empty,
++# so we expand them here.
+ EXTRA_TARGET_FLAGS =3D \
+ 	'AR=3D$$(AR_FOR_TARGET)' \
+ 	'AS=3D$(COMPILER_AS_FOR_TARGET)' \
+ 	'CC=3D$$(CC_FOR_TARGET)' \
+-	'CFLAGS=3D$$(CFLAGS_FOR_TARGET)' \
++	'CFLAGS=3D$$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)' \
+ 	'CXX=3D$$(CXX_FOR_TARGET)' \
+-	'CXXFLAGS=3D$$(CXXFLAGS_FOR_TARGET)' \
++	'CXXFLAGS=3D$$(CXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG=
_PREFIX_CFLAGS_FOR_TARGET)' \
+ 	'DLLTOOL=3D$$(DLLTOOL_FOR_TARGET)' \
+ 	'LD=3D$(COMPILER_LD_FOR_TARGET)' \
+ 	'LDFLAGS=3D$$(LDFLAGS_FOR_TARGET)' \
+-	'LIBCFLAGS=3D$$(LIBCFLAGS_FOR_TARGET)' \
+-	'LIBCXXFLAGS=3D$$(LIBCXXFLAGS_FOR_TARGET)' \
++	'LIBCFLAGS=3D$$(LIBCFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEB=
UG_PREFIX_CFLAGS_FOR_TARGET)' \
++	'LIBCXXFLAGS=3D$$(LIBCXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $=
(DEBUG_PREFIX_CFLAGS_FOR_TARGET)' \
+ 	'NM=3D$(COMPILER_NM_FOR_TARGET)' \
+ 	'OBJDUMP=3D$$(OBJDUMP_FOR_TARGET)' \
+ 	'RANLIB=3D$$(RANLIB_FOR_TARGET)' \
+@@ -851,9 +850,11 @@ configure-stage[+id+]-[+prefix+][+module
+ 	fi; \
+ 	[+ ENDIF check_multilibs +]test ! -f [+subdir+]/[+module+]/Makefile || e=
xit 0; \
+ 	[+exports+][+ IF prev +] \
+-	[+poststage1_exports+][+ ENDIF prev +] \
++	[+poststage1_exports+][+ ENDIF prev +] [+ IF prefix +] \
++	CFLAGS=3D"[+stage_libcflags+] $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFI=
X_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"[+stage_libcflags+] $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS; [+ ELSE +] \
+ 	CFLAGS=3D"[+stage_cflags+]"; export CFLAGS; \
+-	LIBCFLAGS=3D"[+stage_cflags+]"; export LIBCFLAGS; \
++	CXXFLAGS=3D"[+stage_cflags+]"; export CXXFLAGS; [+ ENDIF +] \
+ 	echo Configuring stage [+id+] in [+subdir+]/[+module+] ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs [+subdir+]/[+module+] ; \
+ 	cd [+subdir+]/[+module+] || exit 1; \
+@@ -890,7 +891,8 @@ all-[+prefix+][+module+]: configure-[+pr
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	[+exports+] \
+ 	(cd [+subdir+]/[+module+] && \
+-	  $(MAKE) [+args+] [+extra_make_flags+] $(TARGET-[+prefix+][+module+]))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) [+args+] [+extra_make_flags+] \
++		$(TARGET-[+prefix+][+module+]))
+ @endif [+prefix+][+module+]
+=20
+ [+ IF bootstrap +]
+@@ -910,8 +912,11 @@ all-stage[+id+]-[+prefix+][+module+]: co
+ 	[+exports+][+ IF prev +] \
+ 	[+poststage1_exports+][+ ENDIF prev +] \
+ 	cd [+subdir+]/[+module+] && \
+-	$(MAKE) [+args+] \
+-		CFLAGS=3D"[+stage_cflags+]" LIBCFLAGS=3D"[+stage_cflags+]" [+
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"[+stage_cflags+]" CXXFLAGS=3D"[+stage_cflags+]" \
++		LIBCFLAGS=3D"[+stage_libcflags+]" \
++		CFLAGS_FOR_TARGET=3D"[+stage_libcflags+]" \
++		CXXFLAGS_FOR_TARGET=3D"[+stage_libcflags+]" [+args+] [+
+ 		IF prev +][+poststage1_args+][+ ENDIF prev
+ 		+] [+extra_make_flags+] \
+ 		$(TARGET-stage[+id+]-[+prefix+][+module+])
+@@ -961,7 +966,7 @@ clean-stage[+id+]-[+prefix+][+module+]:
+ [+ all prefix=3D"" subdir=3D"$(HOST_SUBDIR)"
+        exports=3D"$(HOST_EXPORTS)"
+        poststage1_exports=3D"$(POSTSTAGE1_HOST_EXPORTS)"
+-       args=3D"$(FLAGS_TO_PASS)"
++       args=3D"$(EXTRA_HOST_FLAGS)"
+        poststage1_args=3D"$(POSTSTAGE1_FLAGS_TO_PASS)" +]
+=20
+ .PHONY: check-[+module+] maybe-check-[+module+]
+@@ -1059,7 +1064,7 @@ maybe-[+make_target+]-[+module+]: [+make
+=20
+ [+ all prefix=3D"target-" subdir=3D"$(TARGET_SUBDIR)"
+        exports=3D"$(RAW_CXX_TARGET_EXPORTS)"
+-       args=3D"$(TARGET_FLAGS_TO_PASS) 'CXX=3D$$(RAW_CXX_FOR_TARGET)' 'CX=
X_FOR_TARGET=3D$$(RAW_CXX_FOR_TARGET)'" +]
++       args=3D"$(EXTRA_TARGET_FLAGS) 'CXX=3D$$(RAW_CXX_FOR_TARGET)' 'CXX_=
FOR_TARGET=3D$$(RAW_CXX_FOR_TARGET)'" +]
+ [+ ELSE +]
+ [+ configure prefix=3D"target-" subdir=3D"$(TARGET_SUBDIR)"
+ 	     check_multilibs=3Dtrue
+@@ -1070,7 +1075,7 @@ maybe-[+make_target+]-[+module+]: [+make
+=20
+ [+ all prefix=3D"target-" subdir=3D"$(TARGET_SUBDIR)"
+        exports=3D"$(NORMAL_TARGET_EXPORTS)"
+-       args=3D"$(TARGET_FLAGS_TO_PASS)" +]
++       args=3D"$(EXTRA_TARGET_FLAGS)" +]
+ [+ ENDIF +]
+=20
+ .PHONY: check-target-[+module+] maybe-check-target-[+module+]
+Index: gcc-4.3.1/config/mh-ppc-darwin
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/config/mh-ppc-darwin	2007-05-23 07:26:31.000000000 -070=
0
++++ gcc-4.3.1/config/mh-ppc-darwin	2008-07-21 10:56:15.000000000 -0700
+@@ -2,5 +2,4 @@
+ # position-independent-code -- the usual default on Darwin. This fix spee=
ds
+ # compiles by 3-5%.
+=20
+-# Broken because of PR32009.
+-# BOOT_CFLAGS=3D-g -O2 -mdynamic-no-pic
++BOOT_CFLAGS=3D-g -O2 -mdynamic-no-pic
+Index: gcc-4.3.1/gcc/doc/install.texi
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/gcc/doc/install.texi	2008-05-22 23:58:10.000000000 -070=
0
++++ gcc-4.3.1/gcc/doc/install.texi	2008-07-21 10:56:15.000000000 -0700
+@@ -1772,33 +1772,35 @@ same described above, but object files f
+ stage2 of the 3-stage bootstrap of the compiler are deleted as
+ soon as they are no longer needed.
+=20
+-If you want to save additional space during the bootstrap and in
+-the final installation as well, you can build the compiler binaries
+-without debugging information as in the following example.  This will sav=
e
+-roughly 40% of disk space both for the bootstrap and the final installati=
on.
+-(Libraries will still contain debugging information.)
+-
+-@smallexample
+-     make CFLAGS=3D'-O' LIBCFLAGS=3D'-g -O2' \
+-       LIBCXXFLAGS=3D'-g -O2 -fno-implicit-templates' bootstrap
+-@end smallexample
+-
+-If you wish to use non-default GCC flags when compiling the stage2 and
+-stage3 compilers, set @code{BOOT_CFLAGS} on the command line when doing
+-@samp{make}.  Non-default optimization flags are less well
+-tested here than the default of @samp{-g -O2}, but should still work.
+-In a few cases, you may find that you need to specify special flags such
+-as @option{-msoft-float} here to complete the bootstrap; or, if the
+-native compiler miscompiles the stage1 compiler, you may need to work
+-around this, by choosing @code{BOOT_CFLAGS} to avoid the parts of the
+-stage1 compiler that were miscompiled, or by using @samp{make
++If you wish to use non-default GCC flags when compiling the stage2
++and stage3 compilers, set @code{BOOT_CFLAGS} on the command line when
++doing @samp{make}.  For example, if you want to save additional space
++during the bootstrap and in the final installation as well, you can
++build the compiler binaries without debugging information as in the
++following example.  This will save roughly 40% of disk space both for
++the bootstrap and the final installation.  (Libraries will still contain
++debugging information.)
++
++@smallexample
++     make BOOT_CFLAGS=3D'-O' bootstrap
++@end smallexample
++
++You can place non-default optimization flags into @code{BOOT_CFLAGS}; the=
y
++are less well tested here than the default of @samp{-g -O2}, but should
++still work.  In a few cases, you may find that you need to specify specia=
l
++flags such as @option{-msoft-float} here to complete the bootstrap; or,
++if the native compiler miscompiles the stage1 compiler, you may need
++to work around this, by choosing @code{BOOT_CFLAGS} to avoid the parts
++of the stage1 compiler that were miscompiled, or by using @samp{make
+ bootstrap4} to increase the number of stages of bootstrap.
+=20
+-Note that using non-standard @code{CFLAGS} can cause bootstrap to fail
+-if these trigger a warning with the new compiler.  For example using
+-@samp{-O2 -g -mcpu=3Di686} on @code{i686-pc-linux-gnu} will cause bootstr=
ap
+-failure as @option{-mcpu=3D} is deprecated in 3.4.0 and above.
+-
++@code{BOOT_CFLAGS} does not apply to bootstrapped target libraries.
++Since these are always compiled with the compiler currently being
++bootstrapped, you can use @code{CFLAGS_FOR_TARGET} to modify their
++compilation flags, as for non-bootstrapped target libraries.
++Again, if the native compiler miscompiles the stage1 compiler, you may
++need to work around this by avoiding non-working parts of the stage1
++compiler.  Use @code{STAGE1_LIBCFLAGS} to this end.
+=20
+ If you used the flag @option{--enable-languages=3D@dots{}} to restrict
+ the compilers to be built, only those you've actually enabled will be
+@@ -2689,8 +2691,8 @@ cross-compilers on the Alpha for 32-bit=20
+ a few cases and may not work properly.
+=20
+ @samp{make compare} may fail on old versions of DEC Unix unless you add
+-@option{-save-temps} to @code{CFLAGS}.  On these systems, the name of the
+-assembler input file is stored in the object file, and that makes
++@option{-save-temps} to @code{BOOT_CFLAGS}.  On these systems, the name
++of the assembler input file is stored in the object file, and that makes
+ comparison fail if it differs between the @code{stage1} and
+ @code{stage2} compilations.  The option @option{-save-temps} forces a
+ fixed name to be used for the assembler input file, instead of a
+Index: gcc-4.3.1/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/Makefile.in	2008-07-21 10:56:14.000000000 -0700
++++ gcc-4.3.1/Makefile.in	2008-07-21 10:56:15.000000000 -0700
+@@ -204,11 +204,10 @@ BASE_TARGET_EXPORTS =3D \
+ 	AR=3D"$(AR_FOR_TARGET)"; export AR; \
+ 	AS=3D"$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC=3D"$(CC_FOR_TARGET)"; export CC; \
+-	CFLAGS=3D"$(CFLAGS_FOR_TARGET)"; export CFLAGS; \
+-	CPP=3D"$(CC_FOR_TARGET) -E"; export CPP; \
++	CFLAGS=3D"$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREF=
IX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS=3D"$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
+-	CXXFLAGS=3D"$(CXXFLAGS_FOR_TARGET)"; export CXXFLAGS; \
++	CXXFLAGS=3D"$(CXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_=
PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS; \
+ 	GCJ=3D"$(GCJ_FOR_TARGET)"; export GCJ; \
+ 	GFORTRAN=3D"$(GFORTRAN_FOR_TARGET)"; export GFORTRAN; \
+ 	DLLTOOL=3D"$(DLLTOOL_FOR_TARGET)"; export DLLTOOL; \
+@@ -328,14 +327,19 @@ PICFLAG =3D=20
+ # MAKEINFO and MAKEINFOFLAGS are explicitly passed here to make them
+ # overrideable (for a bootstrap build stage1 also builds gcc.info).
+=20
+-STAGE1_CFLAGS=3D@stage1_cflags@
+ STAGE1_CHECKING=3D@stage1_checking@
+ STAGE1_LANGUAGES=3D@stage1_languages@
+=20
++STAGE1_CFLAGS=3D@stage1_cflags@
+ STAGE2_CFLAGS=3D$(BOOT_CFLAGS)
+ STAGE3_CFLAGS=3D$(BOOT_CFLAGS)
+ STAGE4_CFLAGS=3D$(BOOT_CFLAGS)
+=20
++STAGE1_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE2_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE3_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++STAGE4_LIBCFLAGS=3D$(CFLAGS_FOR_TARGET)
++
+ do-compare =3D @do_compare@
+ do-compare3 =3D $(do-compare)
+ do-compare-debug =3D $(SHELL) $(srcdir)/contrib/compare-debug $$f1 $$f2
+@@ -374,18 +378,11 @@ COMPILER_AS_FOR_TARGET=3D@COMPILER_AS_FOR_
+ COMPILER_LD_FOR_TARGET=3D@COMPILER_LD_FOR_TARGET@
+ COMPILER_NM_FOR_TARGET=3D@COMPILER_NM_FOR_TARGET@
+=20
+-# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
+-# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
+-# might also be empty (or "-g", if a non-GCC C++ compiler is in the path)=
.
+-# We want to ensure that TARGET libraries (which we know are built with
+-# gcc) are built with "-O2 -g", so prepend those options when setting
+-# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET =3D -O2 -g $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) \
+-	$(DEBUG_PREFIX_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET =3D @CFLAGS_FOR_TARGET@
++CXXFLAGS_FOR_TARGET =3D @CXXFLAGS_FOR_TARGET@
+ SYSROOT_CFLAGS_FOR_TARGET =3D @SYSROOT_CFLAGS_FOR_TARGET@
+ DEBUG_PREFIX_CFLAGS_FOR_TARGET =3D @DEBUG_PREFIX_CFLAGS_FOR_TARGET@
+-CXXFLAGS_FOR_TARGET =3D -O2 -g $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) \
+-	$(DEBUG_PREFIX_CFLAGS_FOR_TARGET)
++
+ LIBCFLAGS_FOR_TARGET =3D $(CFLAGS_FOR_TARGET)
+ LIBCXXFLAGS_FOR_TARGET =3D $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
+ LDFLAGS_FOR_TARGET =3D @LDFLAGS@=20
+@@ -592,19 +589,20 @@ POSTSTAGE1_FLAGS_TO_PASS =3D \
+ # Flags to pass down to makes which are built with the target environment=
.
+ # The double $ decreases the length of the command line; those variables
+ # are set in BASE_FLAGS_TO_PASS, and the sub-make will expand them.  The
+-# COMPILER_ prefixed variables are not passed down so we expand them here=
.
++# *_CFLAGS_FOR_TARGET variables are not passed down and most often empty,
++# so we expand them here.
+ EXTRA_TARGET_FLAGS =3D \
+ 	'AR=3D$$(AR_FOR_TARGET)' \
+ 	'AS=3D$(COMPILER_AS_FOR_TARGET)' \
+ 	'CC=3D$$(CC_FOR_TARGET)' \
+-	'CFLAGS=3D$$(CFLAGS_FOR_TARGET)' \
++	'CFLAGS=3D$$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)' \
+ 	'CXX=3D$$(CXX_FOR_TARGET)' \
+-	'CXXFLAGS=3D$$(CXXFLAGS_FOR_TARGET)' \
++	'CXXFLAGS=3D$$(CXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG=
_PREFIX_CFLAGS_FOR_TARGET)' \
+ 	'DLLTOOL=3D$$(DLLTOOL_FOR_TARGET)' \
+ 	'LD=3D$(COMPILER_LD_FOR_TARGET)' \
+ 	'LDFLAGS=3D$$(LDFLAGS_FOR_TARGET)' \
+-	'LIBCFLAGS=3D$$(LIBCFLAGS_FOR_TARGET)' \
+-	'LIBCXXFLAGS=3D$$(LIBCXXFLAGS_FOR_TARGET)' \
++	'LIBCFLAGS=3D$$(LIBCFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEB=
UG_PREFIX_CFLAGS_FOR_TARGET)' \
++	'LIBCXXFLAGS=3D$$(LIBCXXFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FOR_TARGET) $=
(DEBUG_PREFIX_CFLAGS_FOR_TARGET)' \
+ 	'NM=3D$(COMPILER_NM_FOR_TARGET)' \
+ 	'OBJDUMP=3D$$(OBJDUMP_FOR_TARGET)' \
+ 	'RANLIB=3D$$(RANLIB_FOR_TARGET)' \
+@@ -2738,7 +2736,8 @@ all-build-libiberty: configure-build-lib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/libiberty && \
+-	  $(MAKE)   $(TARGET-build-libiberty))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-libiberty))
+ @endif build-libiberty
+=20
+=20
+@@ -2793,7 +2792,8 @@ all-build-bison: configure-build-bison
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/bison && \
+-	  $(MAKE)   $(TARGET-build-bison))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-bison))
+ @endif build-bison
+=20
+=20
+@@ -2848,7 +2848,8 @@ all-build-byacc: configure-build-byacc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/byacc && \
+-	  $(MAKE)   $(TARGET-build-byacc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-byacc))
+ @endif build-byacc
+=20
+=20
+@@ -2903,7 +2904,8 @@ all-build-flex: configure-build-flex
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/flex && \
+-	  $(MAKE)   $(TARGET-build-flex))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-flex))
+ @endif build-flex
+=20
+=20
+@@ -2958,7 +2960,8 @@ all-build-m4: configure-build-m4
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/m4 && \
+-	  $(MAKE)   $(TARGET-build-m4))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-m4))
+ @endif build-m4
+=20
+=20
+@@ -3013,7 +3016,8 @@ all-build-texinfo: configure-build-texin
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/texinfo && \
+-	  $(MAKE)   $(TARGET-build-texinfo))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-texinfo))
+ @endif build-texinfo
+=20
+=20
+@@ -3068,7 +3072,8 @@ all-build-fixincludes: configure-build-f
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(BUILD_EXPORTS) \
+ 	(cd $(BUILD_SUBDIR)/fixincludes && \
+-	  $(MAKE)   $(TARGET-build-fixincludes))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS)   \
++		$(TARGET-build-fixincludes))
+ @endif build-fixincludes
+=20
+=20
+@@ -3127,7 +3132,8 @@ all-ash: configure-ash
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/ash && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-ash))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-ash))
+ @endif ash
+=20
+=20
+@@ -3551,7 +3557,8 @@ all-autoconf: configure-autoconf
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/autoconf && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-autoconf))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-autoconf))
+ @endif autoconf
+=20
+=20
+@@ -3975,7 +3982,8 @@ all-automake: configure-automake
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/automake && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-automake))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-automake))
+ @endif automake
+=20
+=20
+@@ -4399,7 +4407,8 @@ all-bash: configure-bash
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/bash && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-bash))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-bash))
+ @endif bash
+=20
+=20
+@@ -4816,9 +4825,9 @@ configure-stage1-bfd:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -4847,9 +4856,9 @@ configure-stage2-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -4878,9 +4887,9 @@ configure-stageb2g0-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -4909,9 +4918,9 @@ configure-stage3-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -4940,9 +4949,9 @@ configure-stageb3g2-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -4971,9 +4980,9 @@ configure-stage4-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -5002,9 +5011,9 @@ configure-stageprofile-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -5033,9 +5042,9 @@ configure-stagefeedback-bfd:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/bfd/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/bfd ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/bfd ; \
+ 	cd $(HOST_SUBDIR)/bfd || exit 1; \
+@@ -5070,7 +5079,8 @@ all-bfd: configure-bfd
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/bfd && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-bfd))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-bfd))
+ @endif bfd
+=20
+=20
+@@ -5089,8 +5099,11 @@ all-stage1-bfd: configure-stage1-bfd
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-bfd)
+=20
+ maybe-clean-stage1-bfd: clean-stage1-bfd
+@@ -5103,7 +5116,7 @@ clean-stage1-bfd:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif bfd-bootstrap
+=20
+@@ -5123,8 +5136,11 @@ all-stage2-bfd: configure-stage2-bfd
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-bfd)
+=20
+ maybe-clean-stage2-bfd: clean-stage2-bfd
+@@ -5137,7 +5153,7 @@ clean-stage2-bfd:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5158,8 +5174,11 @@ all-stageb2g0-bfd: configure-stageb2g0-b
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-bfd)
+=20
+ maybe-clean-stageb2g0-bfd: clean-stageb2g0-bfd
+@@ -5172,7 +5191,7 @@ clean-stageb2g0-bfd:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5193,8 +5212,11 @@ all-stage3-bfd: configure-stage3-bfd
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-bfd)
+=20
+ maybe-clean-stage3-bfd: clean-stage3-bfd
+@@ -5207,7 +5229,7 @@ clean-stage3-bfd:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5228,8 +5250,11 @@ all-stageb3g2-bfd: configure-stageb3g2-b
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-bfd)
+=20
+ maybe-clean-stageb3g2-bfd: clean-stageb3g2-bfd
+@@ -5242,7 +5267,7 @@ clean-stageb3g2-bfd:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5263,8 +5288,11 @@ all-stage4-bfd: configure-stage4-bfd
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-bfd)
+=20
+ maybe-clean-stage4-bfd: clean-stage4-bfd
+@@ -5277,7 +5305,7 @@ clean-stage4-bfd:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5298,8 +5326,11 @@ all-stageprofile-bfd: configure-stagepro
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-bfd)
+=20
+ maybe-clean-stageprofile-bfd: clean-stageprofile-bfd
+@@ -5312,7 +5343,7 @@ clean-stageprofile-bfd:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5333,8 +5364,11 @@ all-stagefeedback-bfd: configure-stagefe
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-bfd)
+=20
+ maybe-clean-stagefeedback-bfd: clean-stagefeedback-bfd
+@@ -5347,7 +5381,7 @@ clean-stagefeedback-bfd:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/bfd && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif bfd-bootstrap
+@@ -5754,9 +5788,9 @@ configure-stage1-opcodes:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5785,9 +5819,9 @@ configure-stage2-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5816,9 +5850,9 @@ configure-stageb2g0-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5847,9 +5881,9 @@ configure-stage3-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5878,9 +5912,9 @@ configure-stageb3g2-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5909,9 +5943,9 @@ configure-stage4-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5940,9 +5974,9 @@ configure-stageprofile-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -5971,9 +6005,9 @@ configure-stagefeedback-opcodes:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/opcodes/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/opcodes ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/opcodes ; \
+ 	cd $(HOST_SUBDIR)/opcodes || exit 1; \
+@@ -6008,7 +6042,8 @@ all-opcodes: configure-opcodes
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/opcodes && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-opcodes))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-opcodes))
+ @endif opcodes
+=20
+=20
+@@ -6027,8 +6062,11 @@ all-stage1-opcodes: configure-stage1-opc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-opcodes)
+=20
+ maybe-clean-stage1-opcodes: clean-stage1-opcodes
+@@ -6041,7 +6079,7 @@ clean-stage1-opcodes:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+=20
+@@ -6061,8 +6099,11 @@ all-stage2-opcodes: configure-stage2-opc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-opcodes)
+=20
+ maybe-clean-stage2-opcodes: clean-stage2-opcodes
+@@ -6075,7 +6116,7 @@ clean-stage2-opcodes:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6096,8 +6137,11 @@ all-stageb2g0-opcodes: configure-stageb2
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-opcodes)
+=20
+ maybe-clean-stageb2g0-opcodes: clean-stageb2g0-opcodes
+@@ -6110,7 +6154,7 @@ clean-stageb2g0-opcodes:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6131,8 +6175,11 @@ all-stage3-opcodes: configure-stage3-opc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-opcodes)
+=20
+ maybe-clean-stage3-opcodes: clean-stage3-opcodes
+@@ -6145,7 +6192,7 @@ clean-stage3-opcodes:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6166,8 +6213,11 @@ all-stageb3g2-opcodes: configure-stageb3
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-opcodes)
+=20
+ maybe-clean-stageb3g2-opcodes: clean-stageb3g2-opcodes
+@@ -6180,7 +6230,7 @@ clean-stageb3g2-opcodes:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6201,8 +6251,11 @@ all-stage4-opcodes: configure-stage4-opc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-opcodes)
+=20
+ maybe-clean-stage4-opcodes: clean-stage4-opcodes
+@@ -6215,7 +6268,7 @@ clean-stage4-opcodes:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6236,8 +6289,11 @@ all-stageprofile-opcodes: configure-stag
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-opcodes)
+=20
+ maybe-clean-stageprofile-opcodes: clean-stageprofile-opcodes
+@@ -6250,7 +6306,7 @@ clean-stageprofile-opcodes:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6271,8 +6327,11 @@ all-stagefeedback-opcodes: configure-sta
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-opcodes)
+=20
+ maybe-clean-stagefeedback-opcodes: clean-stagefeedback-opcodes
+@@ -6285,7 +6344,7 @@ clean-stagefeedback-opcodes:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/opcodes && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif opcodes-bootstrap
+@@ -6692,9 +6751,9 @@ configure-stage1-binutils:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6723,9 +6782,9 @@ configure-stage2-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6754,9 +6813,9 @@ configure-stageb2g0-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6785,9 +6844,9 @@ configure-stage3-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6816,9 +6875,9 @@ configure-stageb3g2-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6847,9 +6906,9 @@ configure-stage4-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6878,9 +6937,9 @@ configure-stageprofile-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6909,9 +6968,9 @@ configure-stagefeedback-binutils:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/binutils/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/binutils ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/binutils ; \
+ 	cd $(HOST_SUBDIR)/binutils || exit 1; \
+@@ -6946,7 +7005,8 @@ all-binutils: configure-binutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/binutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-binutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-binutils))
+ @endif binutils
+=20
+=20
+@@ -6965,8 +7025,11 @@ all-stage1-binutils: configure-stage1-bi
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-binutils)
+=20
+ maybe-clean-stage1-binutils: clean-stage1-binutils
+@@ -6979,7 +7042,7 @@ clean-stage1-binutils:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif binutils-bootstrap
+=20
+@@ -6999,8 +7062,11 @@ all-stage2-binutils: configure-stage2-bi
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-binutils)
+=20
+ maybe-clean-stage2-binutils: clean-stage2-binutils
+@@ -7013,7 +7079,7 @@ clean-stage2-binutils:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7034,8 +7100,11 @@ all-stageb2g0-binutils: configure-stageb
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-binutils)
+=20
+ maybe-clean-stageb2g0-binutils: clean-stageb2g0-binutils
+@@ -7048,7 +7117,7 @@ clean-stageb2g0-binutils:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7069,8 +7138,11 @@ all-stage3-binutils: configure-stage3-bi
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-binutils)
+=20
+ maybe-clean-stage3-binutils: clean-stage3-binutils
+@@ -7083,7 +7155,7 @@ clean-stage3-binutils:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7104,8 +7176,11 @@ all-stageb3g2-binutils: configure-stageb
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-binutils)
+=20
+ maybe-clean-stageb3g2-binutils: clean-stageb3g2-binutils
+@@ -7118,7 +7193,7 @@ clean-stageb3g2-binutils:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7139,8 +7214,11 @@ all-stage4-binutils: configure-stage4-bi
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-binutils)
+=20
+ maybe-clean-stage4-binutils: clean-stage4-binutils
+@@ -7153,7 +7231,7 @@ clean-stage4-binutils:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7174,8 +7252,11 @@ all-stageprofile-binutils: configure-sta
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-binutils)
+=20
+ maybe-clean-stageprofile-binutils: clean-stageprofile-binutils
+@@ -7188,7 +7269,7 @@ clean-stageprofile-binutils:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7209,8 +7290,11 @@ all-stagefeedback-binutils: configure-st
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-binutils)
+=20
+ maybe-clean-stagefeedback-binutils: clean-stagefeedback-binutils
+@@ -7223,7 +7307,7 @@ clean-stagefeedback-binutils:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/binutils && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif binutils-bootstrap
+@@ -7637,7 +7721,8 @@ all-bison: configure-bison
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/bison && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-bison))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-bison))
+ @endif bison
+=20
+=20
+@@ -8064,7 +8149,8 @@ all-byacc: configure-byacc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/byacc && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-byacc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-byacc))
+ @endif byacc
+=20
+=20
+@@ -8491,7 +8577,8 @@ all-bzip2: configure-bzip2
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/bzip2 && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-bzip2))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-bzip2))
+ @endif bzip2
+=20
+=20
+@@ -8915,7 +9002,8 @@ all-dejagnu: configure-dejagnu
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/dejagnu && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-dejagnu))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-dejagnu))
+ @endif dejagnu
+=20
+=20
+@@ -9339,7 +9427,8 @@ all-diff: configure-diff
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/diff && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-diff))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-diff))
+ @endif diff
+=20
+=20
+@@ -9763,7 +9852,8 @@ all-dosutils: configure-dosutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/dosutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-dosutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-dosutils))
+ @endif dosutils
+=20
+=20
+@@ -10181,7 +10271,8 @@ all-etc: configure-etc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/etc && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-etc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-etc))
+ @endif etc
+=20
+=20
+@@ -10605,7 +10696,8 @@ all-fastjar: configure-fastjar
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/fastjar && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-fastjar))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-fastjar))
+ @endif fastjar
+=20
+=20
+@@ -11032,7 +11124,8 @@ all-fileutils: configure-fileutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/fileutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-fileutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-fileutils))
+ @endif fileutils
+=20
+=20
+@@ -11456,7 +11549,8 @@ all-findutils: configure-findutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/findutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-findutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-findutils))
+ @endif findutils
+=20
+=20
+@@ -11880,7 +11974,8 @@ all-find: configure-find
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/find && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-find))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-find))
+ @endif find
+=20
+=20
+@@ -12304,7 +12399,8 @@ all-fixincludes: configure-fixincludes
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/fixincludes && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-fixincludes))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-fixincludes))
+ @endif fixincludes
+=20
+=20
+@@ -12712,7 +12808,8 @@ all-flex: configure-flex
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/flex && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-flex))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-flex))
+ @endif flex
+=20
+=20
+@@ -13132,9 +13229,9 @@ configure-stage1-gas:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13163,9 +13260,9 @@ configure-stage2-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13194,9 +13291,9 @@ configure-stageb2g0-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13225,9 +13322,9 @@ configure-stage3-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13256,9 +13353,9 @@ configure-stageb3g2-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13287,9 +13384,9 @@ configure-stage4-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13318,9 +13415,9 @@ configure-stageprofile-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13349,9 +13446,9 @@ configure-stagefeedback-gas:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gas/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/gas ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gas ; \
+ 	cd $(HOST_SUBDIR)/gas || exit 1; \
+@@ -13386,7 +13483,8 @@ all-gas: configure-gas
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gas && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gas))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gas))
+ @endif gas
+=20
+=20
+@@ -13405,8 +13503,11 @@ all-stage1-gas: configure-stage1-gas
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-gas)
+=20
+ maybe-clean-stage1-gas: clean-stage1-gas
+@@ -13419,7 +13520,7 @@ clean-stage1-gas:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif gas-bootstrap
+=20
+@@ -13439,8 +13540,11 @@ all-stage2-gas: configure-stage2-gas
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-gas)
+=20
+ maybe-clean-stage2-gas: clean-stage2-gas
+@@ -13453,7 +13557,7 @@ clean-stage2-gas:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13474,8 +13578,11 @@ all-stageb2g0-gas: configure-stageb2g0-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-gas)
+=20
+ maybe-clean-stageb2g0-gas: clean-stageb2g0-gas
+@@ -13488,7 +13595,7 @@ clean-stageb2g0-gas:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13509,8 +13616,11 @@ all-stage3-gas: configure-stage3-gas
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-gas)
+=20
+ maybe-clean-stage3-gas: clean-stage3-gas
+@@ -13523,7 +13633,7 @@ clean-stage3-gas:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13544,8 +13654,11 @@ all-stageb3g2-gas: configure-stageb3g2-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-gas)
+=20
+ maybe-clean-stageb3g2-gas: clean-stageb3g2-gas
+@@ -13558,7 +13671,7 @@ clean-stageb3g2-gas:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13579,8 +13692,11 @@ all-stage4-gas: configure-stage4-gas
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-gas)
+=20
+ maybe-clean-stage4-gas: clean-stage4-gas
+@@ -13593,7 +13709,7 @@ clean-stage4-gas:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13614,8 +13730,11 @@ all-stageprofile-gas: configure-stagepro
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-gas)
+=20
+ maybe-clean-stageprofile-gas: clean-stageprofile-gas
+@@ -13628,7 +13747,7 @@ clean-stageprofile-gas:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -13649,8 +13768,11 @@ all-stagefeedback-gas: configure-stagefe
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-gas)
+=20
+ maybe-clean-stagefeedback-gas: clean-stagefeedback-gas
+@@ -13663,7 +13785,7 @@ clean-stagefeedback-gas:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gas && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gas-bootstrap
+@@ -14070,9 +14192,9 @@ configure-stage1-gcc:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14101,9 +14223,9 @@ configure-stage2-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14132,9 +14254,9 @@ configure-stageb2g0-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14163,9 +14285,9 @@ configure-stage3-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14194,9 +14316,9 @@ configure-stageb3g2-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14225,9 +14347,9 @@ configure-stage4-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14256,9 +14378,9 @@ configure-stageprofile-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14287,9 +14409,9 @@ configure-stagefeedback-gcc:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gcc/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/gcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gcc ; \
+ 	cd $(HOST_SUBDIR)/gcc || exit 1; \
+@@ -14324,7 +14446,8 @@ all-gcc: configure-gcc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gcc && \
+-	  $(MAKE) $(FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) $(TARGET-gcc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS) $(EXTRA_GCC_FLAGS) \
++		$(TARGET-gcc))
+ @endif gcc
+=20
+=20
+@@ -14343,8 +14466,11 @@ all-stage1-gcc: configure-stage1-gcc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"  $(EXTRA_GCC=
_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)  $(EXTR=
A_GCC_FLAGS) \
+ 		$(TARGET-stage1-gcc)
+=20
+ maybe-clean-stage1-gcc: clean-stage1-gcc
+@@ -14357,7 +14483,7 @@ clean-stage1-gcc:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+=20
+@@ -14377,8 +14503,11 @@ all-stage2-gcc: configure-stage2-gcc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stage2-gcc)
+=20
+ maybe-clean-stage2-gcc: clean-stage2-gcc
+@@ -14391,7 +14520,7 @@ clean-stage2-gcc:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14412,8 +14541,11 @@ all-stageb2g0-gcc: configure-stageb2g0-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stageb2g0-gcc)
+=20
+ maybe-clean-stageb2g0-gcc: clean-stageb2g0-gcc
+@@ -14426,7 +14558,7 @@ clean-stageb2g0-gcc:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14447,8 +14579,11 @@ all-stage3-gcc: configure-stage3-gcc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stage3-gcc)
+=20
+ maybe-clean-stage3-gcc: clean-stage3-gcc
+@@ -14461,7 +14596,7 @@ clean-stage3-gcc:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14482,8 +14617,11 @@ all-stageb3g2-gcc: configure-stageb3g2-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stageb3g2-gcc)
+=20
+ maybe-clean-stageb3g2-gcc: clean-stageb3g2-gcc
+@@ -14496,7 +14634,7 @@ clean-stageb3g2-gcc:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14517,8 +14655,11 @@ all-stage4-gcc: configure-stage4-gcc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stage4-gcc)
+=20
+ maybe-clean-stage4-gcc: clean-stage4-gcc
+@@ -14531,7 +14672,7 @@ clean-stage4-gcc:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14552,8 +14693,11 @@ all-stageprofile-gcc: configure-stagepro
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stageprofile-gcc)
+=20
+ maybe-clean-stageprofile-gcc: clean-stageprofile-gcc
+@@ -14566,7 +14710,7 @@ clean-stageprofile-gcc:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -14587,8 +14731,11 @@ all-stagefeedback-gcc: configure-stagefe
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS) $(EXTRA_GCC_FLAGS) \
+ 		$(TARGET-stagefeedback-gcc)
+=20
+ maybe-clean-stagefeedback-gcc: clean-stagefeedback-gcc
+@@ -14601,7 +14748,7 @@ clean-stagefeedback-gcc:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gcc && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(EXTRA_GCC_FLAGS) clean
+ @endif gcc-bootstrap
+@@ -15015,7 +15162,8 @@ all-gawk: configure-gawk
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gawk && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gawk))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gawk))
+ @endif gawk
+=20
+=20
+@@ -15439,7 +15587,8 @@ all-gettext: configure-gettext
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gettext && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gettext))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gettext))
+ @endif gettext
+=20
+=20
+@@ -15856,9 +16005,9 @@ configure-stage1-gmp:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -15887,9 +16036,9 @@ configure-stage2-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -15918,9 +16067,9 @@ configure-stageb2g0-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -15949,9 +16098,9 @@ configure-stage3-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -15980,9 +16129,9 @@ configure-stageb3g2-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -16011,9 +16160,9 @@ configure-stage4-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -16042,9 +16191,9 @@ configure-stageprofile-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -16073,9 +16222,9 @@ configure-stagefeedback-gmp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/gmp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/gmp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/gmp ; \
+ 	cd $(HOST_SUBDIR)/gmp || exit 1; \
+@@ -16110,7 +16259,8 @@ all-gmp: configure-gmp
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gmp && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gmp))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gmp))
+ @endif gmp
+=20
+=20
+@@ -16129,8 +16279,11 @@ all-stage1-gmp: configure-stage1-gmp
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-gmp)
+=20
+ maybe-clean-stage1-gmp: clean-stage1-gmp
+@@ -16143,7 +16296,7 @@ clean-stage1-gmp:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif gmp-bootstrap
+=20
+@@ -16163,8 +16316,11 @@ all-stage2-gmp: configure-stage2-gmp
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-gmp)
+=20
+ maybe-clean-stage2-gmp: clean-stage2-gmp
+@@ -16177,7 +16333,7 @@ clean-stage2-gmp:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16198,8 +16354,11 @@ all-stageb2g0-gmp: configure-stageb2g0-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-gmp)
+=20
+ maybe-clean-stageb2g0-gmp: clean-stageb2g0-gmp
+@@ -16212,7 +16371,7 @@ clean-stageb2g0-gmp:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16233,8 +16392,11 @@ all-stage3-gmp: configure-stage3-gmp
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-gmp)
+=20
+ maybe-clean-stage3-gmp: clean-stage3-gmp
+@@ -16247,7 +16409,7 @@ clean-stage3-gmp:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16268,8 +16430,11 @@ all-stageb3g2-gmp: configure-stageb3g2-g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-gmp)
+=20
+ maybe-clean-stageb3g2-gmp: clean-stageb3g2-gmp
+@@ -16282,7 +16447,7 @@ clean-stageb3g2-gmp:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16303,8 +16468,11 @@ all-stage4-gmp: configure-stage4-gmp
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-gmp)
+=20
+ maybe-clean-stage4-gmp: clean-stage4-gmp
+@@ -16317,7 +16485,7 @@ clean-stage4-gmp:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16338,8 +16506,11 @@ all-stageprofile-gmp: configure-stagepro
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-gmp)
+=20
+ maybe-clean-stageprofile-gmp: clean-stageprofile-gmp
+@@ -16352,7 +16523,7 @@ clean-stageprofile-gmp:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16373,8 +16544,11 @@ all-stagefeedback-gmp: configure-stagefe
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-gmp)
+=20
+ maybe-clean-stagefeedback-gmp: clean-stagefeedback-gmp
+@@ -16387,7 +16561,7 @@ clean-stagefeedback-gmp:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/gmp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif gmp-bootstrap
+@@ -16788,9 +16962,9 @@ configure-stage1-mpfr:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16819,9 +16993,9 @@ configure-stage2-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16850,9 +17024,9 @@ configure-stageb2g0-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16881,9 +17055,9 @@ configure-stage3-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16912,9 +17086,9 @@ configure-stageb3g2-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16943,9 +17117,9 @@ configure-stage4-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -16974,9 +17148,9 @@ configure-stageprofile-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -17005,9 +17179,9 @@ configure-stagefeedback-mpfr:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/mpfr/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/mpfr ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/mpfr ; \
+ 	cd $(HOST_SUBDIR)/mpfr || exit 1; \
+@@ -17042,7 +17216,8 @@ all-mpfr: configure-mpfr
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/mpfr && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-mpfr))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-mpfr))
+ @endif mpfr
+=20
+=20
+@@ -17061,8 +17236,11 @@ all-stage1-mpfr: configure-stage1-mpfr
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-mpfr)
+=20
+ maybe-clean-stage1-mpfr: clean-stage1-mpfr
+@@ -17075,7 +17253,7 @@ clean-stage1-mpfr:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+=20
+@@ -17095,8 +17273,11 @@ all-stage2-mpfr: configure-stage2-mpfr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-mpfr)
+=20
+ maybe-clean-stage2-mpfr: clean-stage2-mpfr
+@@ -17109,7 +17290,7 @@ clean-stage2-mpfr:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17130,8 +17311,11 @@ all-stageb2g0-mpfr: configure-stageb2g0-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-mpfr)
+=20
+ maybe-clean-stageb2g0-mpfr: clean-stageb2g0-mpfr
+@@ -17144,7 +17328,7 @@ clean-stageb2g0-mpfr:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17165,8 +17349,11 @@ all-stage3-mpfr: configure-stage3-mpfr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-mpfr)
+=20
+ maybe-clean-stage3-mpfr: clean-stage3-mpfr
+@@ -17179,7 +17366,7 @@ clean-stage3-mpfr:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17200,8 +17387,11 @@ all-stageb3g2-mpfr: configure-stageb3g2-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-mpfr)
+=20
+ maybe-clean-stageb3g2-mpfr: clean-stageb3g2-mpfr
+@@ -17214,7 +17404,7 @@ clean-stageb3g2-mpfr:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17235,8 +17425,11 @@ all-stage4-mpfr: configure-stage4-mpfr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-mpfr)
+=20
+ maybe-clean-stage4-mpfr: clean-stage4-mpfr
+@@ -17249,7 +17442,7 @@ clean-stage4-mpfr:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17270,8 +17463,11 @@ all-stageprofile-mpfr: configure-stagepr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-mpfr)
+=20
+ maybe-clean-stageprofile-mpfr: clean-stageprofile-mpfr
+@@ -17284,7 +17480,7 @@ clean-stageprofile-mpfr:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17305,8 +17501,11 @@ all-stagefeedback-mpfr: configure-stagef
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-mpfr)
+=20
+ maybe-clean-stagefeedback-mpfr: clean-stagefeedback-mpfr
+@@ -17319,7 +17518,7 @@ clean-stagefeedback-mpfr:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/mpfr && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif mpfr-bootstrap
+@@ -17727,7 +17926,8 @@ all-gnuserv: configure-gnuserv
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gnuserv && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gnuserv))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gnuserv))
+ @endif gnuserv
+=20
+=20
+@@ -18151,7 +18351,8 @@ all-gprof: configure-gprof
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gprof && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gprof))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gprof))
+ @endif gprof
+=20
+=20
+@@ -18575,7 +18776,8 @@ all-gzip: configure-gzip
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gzip && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gzip))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gzip))
+ @endif gzip
+=20
+=20
+@@ -18999,7 +19201,8 @@ all-hello: configure-hello
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/hello && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-hello))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-hello))
+ @endif hello
+=20
+=20
+@@ -19423,7 +19626,8 @@ all-indent: configure-indent
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/indent && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-indent))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-indent))
+ @endif indent
+=20
+=20
+@@ -19840,9 +20044,9 @@ configure-stage1-intl:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -19871,9 +20075,9 @@ configure-stage2-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -19902,9 +20106,9 @@ configure-stageb2g0-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -19933,9 +20137,9 @@ configure-stage3-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -19964,9 +20168,9 @@ configure-stageb3g2-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -19995,9 +20199,9 @@ configure-stage4-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -20026,9 +20230,9 @@ configure-stageprofile-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -20057,9 +20261,9 @@ configure-stagefeedback-intl:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/intl/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/intl ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/intl ; \
+ 	cd $(HOST_SUBDIR)/intl || exit 1; \
+@@ -20094,7 +20298,8 @@ all-intl: configure-intl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/intl && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-intl))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-intl))
+ @endif intl
+=20
+=20
+@@ -20113,8 +20318,11 @@ all-stage1-intl: configure-stage1-intl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-intl)
+=20
+ maybe-clean-stage1-intl: clean-stage1-intl
+@@ -20127,7 +20335,7 @@ clean-stage1-intl:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif intl-bootstrap
+=20
+@@ -20147,8 +20355,11 @@ all-stage2-intl: configure-stage2-intl
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-intl)
+=20
+ maybe-clean-stage2-intl: clean-stage2-intl
+@@ -20161,7 +20372,7 @@ clean-stage2-intl:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20182,8 +20393,11 @@ all-stageb2g0-intl: configure-stageb2g0-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-intl)
+=20
+ maybe-clean-stageb2g0-intl: clean-stageb2g0-intl
+@@ -20196,7 +20410,7 @@ clean-stageb2g0-intl:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20217,8 +20431,11 @@ all-stage3-intl: configure-stage3-intl
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-intl)
+=20
+ maybe-clean-stage3-intl: clean-stage3-intl
+@@ -20231,7 +20448,7 @@ clean-stage3-intl:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20252,8 +20469,11 @@ all-stageb3g2-intl: configure-stageb3g2-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-intl)
+=20
+ maybe-clean-stageb3g2-intl: clean-stageb3g2-intl
+@@ -20266,7 +20486,7 @@ clean-stageb3g2-intl:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20287,8 +20507,11 @@ all-stage4-intl: configure-stage4-intl
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-intl)
+=20
+ maybe-clean-stage4-intl: clean-stage4-intl
+@@ -20301,7 +20524,7 @@ clean-stage4-intl:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20322,8 +20545,11 @@ all-stageprofile-intl: configure-stagepr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-intl)
+=20
+ maybe-clean-stageprofile-intl: clean-stageprofile-intl
+@@ -20336,7 +20562,7 @@ clean-stageprofile-intl:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20357,8 +20583,11 @@ all-stagefeedback-intl: configure-stagef
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-intl)
+=20
+ maybe-clean-stagefeedback-intl: clean-stagefeedback-intl
+@@ -20371,7 +20600,7 @@ clean-stagefeedback-intl:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/intl && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif intl-bootstrap
+@@ -20785,7 +21014,8 @@ all-tcl: configure-tcl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/tcl && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-tcl))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-tcl))
+ @endif tcl
+=20
+=20
+@@ -21194,7 +21424,8 @@ all-itcl: configure-itcl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/itcl && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-itcl))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-itcl))
+ @endif itcl
+=20
+=20
+@@ -21611,9 +21842,9 @@ configure-stage1-ld:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21642,9 +21873,9 @@ configure-stage2-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21673,9 +21904,9 @@ configure-stageb2g0-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21704,9 +21935,9 @@ configure-stage3-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21735,9 +21966,9 @@ configure-stageb3g2-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21766,9 +21997,9 @@ configure-stage4-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21797,9 +22028,9 @@ configure-stageprofile-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21828,9 +22059,9 @@ configure-stagefeedback-ld:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/ld/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/ld ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/ld ; \
+ 	cd $(HOST_SUBDIR)/ld || exit 1; \
+@@ -21865,7 +22096,8 @@ all-ld: configure-ld
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/ld && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-ld))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-ld))
+ @endif ld
+=20
+=20
+@@ -21884,8 +22116,11 @@ all-stage1-ld: configure-stage1-ld
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-ld)
+=20
+ maybe-clean-stage1-ld: clean-stage1-ld
+@@ -21898,7 +22133,7 @@ clean-stage1-ld:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif ld-bootstrap
+=20
+@@ -21918,8 +22153,11 @@ all-stage2-ld: configure-stage2-ld
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-ld)
+=20
+ maybe-clean-stage2-ld: clean-stage2-ld
+@@ -21932,7 +22170,7 @@ clean-stage2-ld:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -21953,8 +22191,11 @@ all-stageb2g0-ld: configure-stageb2g0-ld
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-ld)
+=20
+ maybe-clean-stageb2g0-ld: clean-stageb2g0-ld
+@@ -21967,7 +22208,7 @@ clean-stageb2g0-ld:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -21988,8 +22229,11 @@ all-stage3-ld: configure-stage3-ld
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-ld)
+=20
+ maybe-clean-stage3-ld: clean-stage3-ld
+@@ -22002,7 +22246,7 @@ clean-stage3-ld:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -22023,8 +22267,11 @@ all-stageb3g2-ld: configure-stageb3g2-ld
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-ld)
+=20
+ maybe-clean-stageb3g2-ld: clean-stageb3g2-ld
+@@ -22037,7 +22284,7 @@ clean-stageb3g2-ld:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -22058,8 +22305,11 @@ all-stage4-ld: configure-stage4-ld
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-ld)
+=20
+ maybe-clean-stage4-ld: clean-stage4-ld
+@@ -22072,7 +22322,7 @@ clean-stage4-ld:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -22093,8 +22343,11 @@ all-stageprofile-ld: configure-stageprof
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-ld)
+=20
+ maybe-clean-stageprofile-ld: clean-stageprofile-ld
+@@ -22107,7 +22360,7 @@ clean-stageprofile-ld:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -22128,8 +22381,11 @@ all-stagefeedback-ld: configure-stagefee
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-ld)
+=20
+ maybe-clean-stagefeedback-ld: clean-stagefeedback-ld
+@@ -22142,7 +22398,7 @@ clean-stagefeedback-ld:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/ld && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif ld-bootstrap
+@@ -22549,9 +22805,9 @@ configure-stage1-libcpp:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22580,9 +22836,9 @@ configure-stage2-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22611,9 +22867,9 @@ configure-stageb2g0-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22642,9 +22898,9 @@ configure-stage3-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22673,9 +22929,9 @@ configure-stageb3g2-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22704,9 +22960,9 @@ configure-stage4-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22735,9 +22991,9 @@ configure-stageprofile-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22766,9 +23022,9 @@ configure-stagefeedback-libcpp:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libcpp/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/libcpp ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libcpp ; \
+ 	cd $(HOST_SUBDIR)/libcpp || exit 1; \
+@@ -22803,7 +23059,8 @@ all-libcpp: configure-libcpp
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libcpp && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libcpp))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libcpp))
+ @endif libcpp
+=20
+=20
+@@ -22822,8 +23079,11 @@ all-stage1-libcpp: configure-stage1-libc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-libcpp)
+=20
+ maybe-clean-stage1-libcpp: clean-stage1-libcpp
+@@ -22836,7 +23096,7 @@ clean-stage1-libcpp:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+=20
+@@ -22856,8 +23116,11 @@ all-stage2-libcpp: configure-stage2-libc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-libcpp)
+=20
+ maybe-clean-stage2-libcpp: clean-stage2-libcpp
+@@ -22870,7 +23133,7 @@ clean-stage2-libcpp:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -22891,8 +23154,11 @@ all-stageb2g0-libcpp: configure-stageb2g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-libcpp)
+=20
+ maybe-clean-stageb2g0-libcpp: clean-stageb2g0-libcpp
+@@ -22905,7 +23171,7 @@ clean-stageb2g0-libcpp:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -22926,8 +23192,11 @@ all-stage3-libcpp: configure-stage3-libc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-libcpp)
+=20
+ maybe-clean-stage3-libcpp: clean-stage3-libcpp
+@@ -22940,7 +23209,7 @@ clean-stage3-libcpp:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -22961,8 +23230,11 @@ all-stageb3g2-libcpp: configure-stageb3g
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-libcpp)
+=20
+ maybe-clean-stageb3g2-libcpp: clean-stageb3g2-libcpp
+@@ -22975,7 +23247,7 @@ clean-stageb3g2-libcpp:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -22996,8 +23268,11 @@ all-stage4-libcpp: configure-stage4-libc
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-libcpp)
+=20
+ maybe-clean-stage4-libcpp: clean-stage4-libcpp
+@@ -23010,7 +23285,7 @@ clean-stage4-libcpp:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -23031,8 +23306,11 @@ all-stageprofile-libcpp: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-libcpp)
+=20
+ maybe-clean-stageprofile-libcpp: clean-stageprofile-libcpp
+@@ -23045,7 +23323,7 @@ clean-stageprofile-libcpp:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -23066,8 +23344,11 @@ all-stagefeedback-libcpp: configure-stag
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-libcpp)
+=20
+ maybe-clean-stagefeedback-libcpp: clean-stagefeedback-libcpp
+@@ -23080,7 +23361,7 @@ clean-stagefeedback-libcpp:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libcpp && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libcpp-bootstrap
+@@ -23487,9 +23768,9 @@ configure-stage1-libdecnumber:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23518,9 +23799,9 @@ configure-stage2-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23549,9 +23830,9 @@ configure-stageb2g0-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23580,9 +23861,9 @@ configure-stage3-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23611,9 +23892,9 @@ configure-stageb3g2-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23642,9 +23923,9 @@ configure-stage4-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23673,9 +23954,9 @@ configure-stageprofile-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23704,9 +23985,9 @@ configure-stagefeedback-libdecnumber:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libdecnumber/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/libdecnumber ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libdecnumber ; \
+ 	cd $(HOST_SUBDIR)/libdecnumber || exit 1; \
+@@ -23741,7 +24022,8 @@ all-libdecnumber: configure-libdecnumber
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libdecnumber && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libdecnumber))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libdecnumber))
+ @endif libdecnumber
+=20
+=20
+@@ -23760,8 +24042,11 @@ all-stage1-libdecnumber: configure-stage
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-libdecnumber)
+=20
+ maybe-clean-stage1-libdecnumber: clean-stage1-libdecnumber
+@@ -23774,7 +24059,7 @@ clean-stage1-libdecnumber:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+=20
+@@ -23794,8 +24079,11 @@ all-stage2-libdecnumber: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-libdecnumber)
+=20
+ maybe-clean-stage2-libdecnumber: clean-stage2-libdecnumber
+@@ -23808,7 +24096,7 @@ clean-stage2-libdecnumber:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -23829,8 +24117,11 @@ all-stageb2g0-libdecnumber: configure-st
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-libdecnumber)
+=20
+ maybe-clean-stageb2g0-libdecnumber: clean-stageb2g0-libdecnumber
+@@ -23843,7 +24134,7 @@ clean-stageb2g0-libdecnumber:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -23864,8 +24155,11 @@ all-stage3-libdecnumber: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-libdecnumber)
+=20
+ maybe-clean-stage3-libdecnumber: clean-stage3-libdecnumber
+@@ -23878,7 +24172,7 @@ clean-stage3-libdecnumber:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -23899,8 +24193,11 @@ all-stageb3g2-libdecnumber: configure-st
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-libdecnumber)
+=20
+ maybe-clean-stageb3g2-libdecnumber: clean-stageb3g2-libdecnumber
+@@ -23913,7 +24210,7 @@ clean-stageb3g2-libdecnumber:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -23934,8 +24231,11 @@ all-stage4-libdecnumber: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-libdecnumber)
+=20
+ maybe-clean-stage4-libdecnumber: clean-stage4-libdecnumber
+@@ -23948,7 +24248,7 @@ clean-stage4-libdecnumber:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -23969,8 +24269,11 @@ all-stageprofile-libdecnumber: configure
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-libdecnumber)
+=20
+ maybe-clean-stageprofile-libdecnumber: clean-stageprofile-libdecnumber
+@@ -23983,7 +24286,7 @@ clean-stageprofile-libdecnumber:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -24004,8 +24307,11 @@ all-stagefeedback-libdecnumber: configur
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-libdecnumber)
+=20
+ maybe-clean-stagefeedback-libdecnumber: clean-stagefeedback-libdecnumber
+@@ -24018,7 +24324,7 @@ clean-stagefeedback-libdecnumber:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libdecnumber && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libdecnumber-bootstrap
+@@ -24432,7 +24738,8 @@ all-libgui: configure-libgui
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libgui && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libgui))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libgui))
+ @endif libgui
+=20
+=20
+@@ -24849,9 +25156,9 @@ configure-stage1-libiberty:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -24880,9 +25187,9 @@ configure-stage2-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -24911,9 +25218,9 @@ configure-stageb2g0-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -24942,9 +25249,9 @@ configure-stage3-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -24973,9 +25280,9 @@ configure-stageb3g2-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -25004,9 +25311,9 @@ configure-stage4-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -25035,9 +25342,9 @@ configure-stageprofile-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -25066,9 +25373,9 @@ configure-stagefeedback-libiberty:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/libiberty/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/libiberty ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/libiberty ; \
+ 	cd $(HOST_SUBDIR)/libiberty || exit 1; \
+@@ -25103,7 +25410,8 @@ all-libiberty: configure-libiberty
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libiberty && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libiberty))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libiberty))
+ @endif libiberty
+=20
+=20
+@@ -25122,8 +25430,11 @@ all-stage1-libiberty: configure-stage1-l
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-libiberty)
+=20
+ maybe-clean-stage1-libiberty: clean-stage1-libiberty
+@@ -25136,7 +25447,7 @@ clean-stage1-libiberty:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+=20
+@@ -25156,8 +25467,11 @@ all-stage2-libiberty: configure-stage2-l
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-libiberty)
+=20
+ maybe-clean-stage2-libiberty: clean-stage2-libiberty
+@@ -25170,7 +25484,7 @@ clean-stage2-libiberty:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25191,8 +25505,11 @@ all-stageb2g0-libiberty: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-libiberty)
+=20
+ maybe-clean-stageb2g0-libiberty: clean-stageb2g0-libiberty
+@@ -25205,7 +25522,7 @@ clean-stageb2g0-libiberty:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25226,8 +25543,11 @@ all-stage3-libiberty: configure-stage3-l
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-libiberty)
+=20
+ maybe-clean-stage3-libiberty: clean-stage3-libiberty
+@@ -25240,7 +25560,7 @@ clean-stage3-libiberty:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25261,8 +25581,11 @@ all-stageb3g2-libiberty: configure-stage
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-libiberty)
+=20
+ maybe-clean-stageb3g2-libiberty: clean-stageb3g2-libiberty
+@@ -25275,7 +25598,7 @@ clean-stageb3g2-libiberty:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25296,8 +25619,11 @@ all-stage4-libiberty: configure-stage4-l
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-libiberty)
+=20
+ maybe-clean-stage4-libiberty: clean-stage4-libiberty
+@@ -25310,7 +25636,7 @@ clean-stage4-libiberty:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25331,8 +25657,11 @@ all-stageprofile-libiberty: configure-st
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-libiberty)
+=20
+ maybe-clean-stageprofile-libiberty: clean-stageprofile-libiberty
+@@ -25345,7 +25674,7 @@ clean-stageprofile-libiberty:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25366,8 +25695,11 @@ all-stagefeedback-libiberty: configure-s
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-libiberty)
+=20
+ maybe-clean-stagefeedback-libiberty: clean-stagefeedback-libiberty
+@@ -25380,7 +25712,7 @@ clean-stagefeedback-libiberty:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/libiberty && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif libiberty-bootstrap
+@@ -25794,7 +26126,8 @@ all-libtool: configure-libtool
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libtool && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libtool))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libtool))
+ @endif libtool
+=20
+=20
+@@ -26218,7 +26551,8 @@ all-m4: configure-m4
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/m4 && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-m4))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-m4))
+ @endif m4
+=20
+=20
+@@ -26642,7 +26976,8 @@ all-make: configure-make
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/make && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-make))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-make))
+ @endif make
+=20
+=20
+@@ -27066,7 +27401,8 @@ all-mmalloc: configure-mmalloc
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/mmalloc && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-mmalloc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-mmalloc))
+ @endif mmalloc
+=20
+=20
+@@ -27484,7 +27820,8 @@ all-patch: configure-patch
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/patch && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-patch))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-patch))
+ @endif patch
+=20
+=20
+@@ -27908,7 +28245,8 @@ all-perl: configure-perl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/perl && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-perl))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-perl))
+ @endif perl
+=20
+=20
+@@ -28332,7 +28670,8 @@ all-prms: configure-prms
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/prms && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-prms))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-prms))
+ @endif prms
+=20
+=20
+@@ -28756,7 +29095,8 @@ all-rcs: configure-rcs
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/rcs && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-rcs))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-rcs))
+ @endif rcs
+=20
+=20
+@@ -29180,7 +29520,8 @@ all-readline: configure-readline
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/readline && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-readline))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-readline))
+ @endif readline
+=20
+=20
+@@ -29604,7 +29945,8 @@ all-release: configure-release
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/release && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-release))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-release))
+ @endif release
+=20
+=20
+@@ -30016,7 +30358,8 @@ all-recode: configure-recode
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/recode && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-recode))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-recode))
+ @endif recode
+=20
+=20
+@@ -30440,7 +30783,8 @@ all-sed: configure-sed
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/sed && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-sed))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-sed))
+ @endif sed
+=20
+=20
+@@ -30864,7 +31208,8 @@ all-send-pr: configure-send-pr
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/send-pr && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-send-pr))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-send-pr))
+ @endif send-pr
+=20
+=20
+@@ -31288,7 +31633,8 @@ all-shellutils: configure-shellutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/shellutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-shellutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-shellutils))
+ @endif shellutils
+=20
+=20
+@@ -31712,7 +32058,8 @@ all-sid: configure-sid
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/sid && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-sid))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-sid))
+ @endif sid
+=20
+=20
+@@ -32136,7 +32483,8 @@ all-sim: configure-sim
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/sim && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-sim))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-sim))
+ @endif sim
+=20
+=20
+@@ -32560,7 +32908,8 @@ all-tar: configure-tar
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/tar && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-tar))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-tar))
+ @endif tar
+=20
+=20
+@@ -32984,7 +33333,8 @@ all-texinfo: configure-texinfo
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/texinfo && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-texinfo))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-texinfo))
+ @endif texinfo
+=20
+=20
+@@ -33402,7 +33752,8 @@ all-textutils: configure-textutils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/textutils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-textutils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-textutils))
+ @endif textutils
+=20
+=20
+@@ -33826,7 +34177,8 @@ all-time: configure-time
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/time && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-time))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-time))
+ @endif time
+=20
+=20
+@@ -34250,7 +34602,8 @@ all-uudecode: configure-uudecode
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/uudecode && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-uudecode))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-uudecode))
+ @endif uudecode
+=20
+=20
+@@ -34674,7 +35027,8 @@ all-wdiff: configure-wdiff
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/wdiff && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-wdiff))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-wdiff))
+ @endif wdiff
+=20
+=20
+@@ -35098,7 +35452,8 @@ all-zip: configure-zip
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/zip && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-zip))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-zip))
+ @endif zip
+=20
+=20
+@@ -35518,9 +35873,9 @@ configure-stage1-zlib:
+ 	@r=3D`${PWD_COMMAND}`; export r; \
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+-	$(HOST_EXPORTS) \
++	$(HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35549,9 +35904,9 @@ configure-stage2-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35580,9 +35935,9 @@ configure-stageb2g0-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35611,9 +35966,9 @@ configure-stage3-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35642,9 +35997,9 @@ configure-stageb3g2-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35673,9 +36028,9 @@ configure-stage4-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35704,9 +36059,9 @@ configure-stageprofile-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35735,9 +36090,9 @@ configure-stagefeedback-zlib:
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	test ! -f $(HOST_SUBDIR)/zlib/Makefile || exit 0; \
+ 	$(HOST_EXPORTS) \
+-	$(POSTSTAGE1_HOST_EXPORTS) \
++	$(POSTSTAGE1_HOST_EXPORTS)  \
+ 	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(HOST_SUBDIR)/zlib ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(HOST_SUBDIR)/zlib ; \
+ 	cd $(HOST_SUBDIR)/zlib || exit 1; \
+@@ -35772,7 +36127,8 @@ all-zlib: configure-zlib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/zlib && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-zlib))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-zlib))
+ @endif zlib
+=20
+=20
+@@ -35791,8 +36147,11 @@ all-stage1-zlib: configure-stage1-zlib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_HOST_FLAGS)   \
+ 		$(TARGET-stage1-zlib)
+=20
+ maybe-clean-stage1-zlib: clean-stage1-zlib
+@@ -35805,7 +36164,7 @@ clean-stage1-zlib:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		 clean
+ @endif zlib-bootstrap
+=20
+@@ -35825,8 +36184,11 @@ all-stage2-zlib: configure-stage2-zlib
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage2-zlib)
+=20
+ maybe-clean-stage2-zlib: clean-stage2-zlib
+@@ -35839,7 +36201,7 @@ clean-stage2-zlib:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -35860,8 +36222,11 @@ all-stageb2g0-zlib: configure-stageb2g0-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb2g0-zlib)
+=20
+ maybe-clean-stageb2g0-zlib: clean-stageb2g0-zlib
+@@ -35874,7 +36239,7 @@ clean-stageb2g0-zlib:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -35895,8 +36260,11 @@ all-stage3-zlib: configure-stage3-zlib
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTS=
TAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage3-zlib)
+=20
+ maybe-clean-stage3-zlib: clean-stage3-zlib
+@@ -35909,7 +36277,7 @@ clean-stage3-zlib:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -35930,8 +36298,11 @@ all-stageb3g2-zlib: configure-stageb3g2-
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2" $(PO=
STSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_HOST_FLAGS) $(P=
OSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageb3g2-zlib)
+=20
+ maybe-clean-stageb3g2-zlib: clean-stageb3g2-zlib
+@@ -35944,7 +36315,7 @@ clean-stageb3g2-zlib:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -35965,8 +36336,11 @@ all-stage4-zlib: configure-stage4-zlib
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)" $(POSTSTAGE1=
_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_HOST_FLAGS) $(POSTSTAG=
E1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stage4-zlib)
+=20
+ maybe-clean-stage4-zlib: clean-stage4-zlib
+@@ -35979,7 +36353,7 @@ clean-stage4-zlib:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -36000,8 +36374,11 @@ all-stageprofile-zlib: configure-stagepr
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
HOST_FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stageprofile-zlib)
+=20
+ maybe-clean-stageprofile-zlib: clean-stageprofile-zlib
+@@ -36014,7 +36391,7 @@ clean-stageprofile-zlib:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -36035,8 +36412,11 @@ all-stagefeedback-zlib: configure-stagef
+ 	$(HOST_EXPORTS) \
+ 	$(POSTSTAGE1_HOST_EXPORTS) \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use" $(POSTSTAGE1_FLAGS_TO_PASS)  \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_HOST_=
FLAGS) $(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		$(TARGET-stagefeedback-zlib)
+=20
+ maybe-clean-stagefeedback-zlib: clean-stagefeedback-zlib
+@@ -36049,7 +36429,7 @@ clean-stagefeedback-zlib:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(HOST_SUBDIR)/zlib && \
+-	$(MAKE) $(FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_HOST_FLAGS)  \
+ 		$(POSTSTAGE1_FLAGS_TO_PASS)  \
+ 		 clean
+ @endif zlib-bootstrap
+@@ -36451,7 +36831,8 @@ all-gdb: configure-gdb
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gdb && \
+-	  $(MAKE) $(FLAGS_TO_PASS) $(X11_FLAGS_TO_PASS) $(TARGET-gdb))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS) $(X11_FLAGS_TO_PASS)=
 \
++		$(TARGET-gdb))
+ @endif gdb
+=20
+=20
+@@ -36875,7 +37256,8 @@ all-expect: configure-expect
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/expect && \
+-	  $(MAKE) $(FLAGS_TO_PASS) $(X11_FLAGS_TO_PASS) $(TARGET-expect))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS) $(X11_FLAGS_TO_PASS)=
 \
++		$(TARGET-expect))
+ @endif expect
+=20
+=20
+@@ -37299,7 +37681,8 @@ all-guile: configure-guile
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/guile && \
+-	  $(MAKE) $(FLAGS_TO_PASS) $(X11_FLAGS_TO_PASS) $(TARGET-guile))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS) $(X11_FLAGS_TO_PASS)=
 \
++		$(TARGET-guile))
+ @endif guile
+=20
+=20
+@@ -37723,7 +38106,8 @@ all-tk: configure-tk
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/tk && \
+-	  $(MAKE) $(FLAGS_TO_PASS) $(X11_FLAGS_TO_PASS) $(TARGET-tk))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS) $(X11_FLAGS_TO_PASS)=
 \
++		$(TARGET-tk))
+ @endif tk
+=20
+=20
+@@ -38147,7 +38531,8 @@ all-libtermcap: configure-libtermcap
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/libtermcap && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-libtermcap))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-libtermcap))
+ @endif libtermcap
+=20
+=20
+@@ -38505,7 +38890,8 @@ all-utils: configure-utils
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/utils && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-utils))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-utils))
+ @endif utils
+=20
+=20
+@@ -38923,7 +39309,8 @@ all-gnattools: configure-gnattools
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(HOST_EXPORTS) \
+ 	(cd $(HOST_SUBDIR)/gnattools && \
+-	  $(MAKE) $(FLAGS_TO_PASS)  $(TARGET-gnattools))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_HOST_FLAGS)  \
++		$(TARGET-gnattools))
+ @endif gnattools
+=20
+=20
+@@ -39368,7 +39755,8 @@ all-target-libstdc++-v3: configure-targe
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(RAW_CXX_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libstdc++-v3 && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS) 'CXX=3D$$(RAW_CXX_FOR_TARGET)' 'CXX_FO=
R_TARGET=3D$$(RAW_CXX_FOR_TARGET)'  $(TARGET-target-libstdc++-v3))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS) 'CXX=3D$$(RAW_CXX_=
FOR_TARGET)' 'CXX_FOR_TARGET=3D$$(RAW_CXX_FOR_TARGET)'  \
++		$(TARGET-target-libstdc++-v3))
+ @endif target-libstdc++-v3
+=20
+=20
+@@ -39809,7 +40197,8 @@ all-target-libmudflap: configure-target-
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libmudflap && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libmudflap))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libmudflap))
+ @endif target-libmudflap
+=20
+=20
+@@ -40250,7 +40639,8 @@ all-target-libssp: configure-target-libs
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libssp && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libssp))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libssp))
+ @endif target-libssp
+=20
+=20
+@@ -40691,7 +41081,8 @@ all-target-newlib: configure-target-newl
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/newlib && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-newlib))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-newlib))
+ @endif target-newlib
+=20
+=20
+@@ -41137,9 +41528,9 @@ configure-stage1-target-libgcc:
+ 	  mv $(TARGET_SUBDIR)/libgcc/multilib.tmp $(TARGET_SUBDIR)/libgcc/multil=
ib.out; \
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+-	$(NORMAL_TARGET_EXPORTS) \
+-	CFLAGS=3D"$(STAGE1_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE1_CFLAGS)"; export LIBCFLAGS; \
++	$(NORMAL_TARGET_EXPORTS)  \
++	CFLAGS=3D"$(STAGE1_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFI=
X_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE1_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage 1 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41180,9 +41571,9 @@ configure-stage2-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE2_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS)"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE2_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFI=
X_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage 2 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41223,9 +41614,9 @@ configure-stageb2g0-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0 $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_P=
REFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0 $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG=
_PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage b2g0 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41266,9 +41657,9 @@ configure-stage3-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE3_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS)"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE3_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFI=
X_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_LIBCFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PRE=
FIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage 3 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41309,9 +41700,9 @@ configure-stageb3g2-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2 $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_P=
REFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2 $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG=
_PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage b3g2 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41352,9 +41743,9 @@ configure-stage4-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE4_CFLAGS)"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE4_CFLAGS)"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE4_CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFIX_C=
FLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE4_CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET) $(DEBUG_PREFIX=
_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage 4 in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41395,9 +41786,9 @@ configure-stageprofile-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate $(SYSROOT_CFLAGS_FOR_TA=
RGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate $(SYSROOT_CFLAGS_FOR_=
TARGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage profile in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41438,9 +41829,9 @@ configure-stagefeedback-target-libgcc:
+ 	fi; \
+ 	test ! -f $(TARGET_SUBDIR)/libgcc/Makefile || exit 0; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+-	 \
+-	CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export CFLAGS; \
+-	LIBCFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use"; export LIBCFLAGS; \
++	  \
++	CFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use $(SYSROOT_CFLAGS_FOR_TARGET)=
 $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
++	CXXFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use $(SYSROOT_CFLAGS_FOR_TARGE=
T) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CXXFLAGS;  \
+ 	echo Configuring stage feedback in $(TARGET_SUBDIR)/libgcc ; \
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgcc ; \
+ 	cd $(TARGET_SUBDIR)/libgcc || exit 1; \
+@@ -41475,7 +41866,8 @@ all-target-libgcc: configure-target-libg
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libgcc && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libgcc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libgcc))
+ @endif target-libgcc
+=20
+=20
+@@ -41494,8 +41886,11 @@ all-stage1-target-libgcc: configure-stag
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE1_CFLAGS)" LIBCFLAGS=3D"$(STAGE1_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE1_CFLAGS)" CXXFLAGS=3D"$(STAGE1_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE1_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE1_LIBCFLAGS)" $(EXTRA_TARGET_FLAGS)   \
+ 		$(TARGET-stage1-target-libgcc)
+=20
+ maybe-clean-stage1-target-libgcc: clean-stage1-target-libgcc
+@@ -41508,7 +41903,7 @@ clean-stage1-target-libgcc:
+ 	  $(MAKE) stage1-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+=20
+@@ -41528,8 +41923,11 @@ all-stage2-target-libgcc: configure-stag
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS)" LIBCFLAGS=3D"$(STAGE2_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS)" CXXFLAGS=3D"$(STAGE2_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS)" $(EXTRA_TARGET_FLAGS)   \
+ 		$(TARGET-stage2-target-libgcc)
+=20
+ maybe-clean-stage2-target-libgcc: clean-stage2-target-libgcc
+@@ -41542,7 +41940,7 @@ clean-stage2-target-libgcc:
+ 	  $(MAKE) stage2-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41563,8 +41961,11 @@ all-stageb2g0-target-libgcc: configure-s
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" LIBCFLAGS=3D"$(STAGE2_CFLAGS) -g0"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -g0" CXXFLAGS=3D"$(STAGE2_CFLAGS) -g0" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -g0" $(EXTRA_TARGET_FLAGS)  =
 \
+ 		$(TARGET-stageb2g0-target-libgcc)
+=20
+ maybe-clean-stageb2g0-target-libgcc: clean-stageb2g0-target-libgcc
+@@ -41577,7 +41978,7 @@ clean-stageb2g0-target-libgcc:
+ 	  $(MAKE) stageb2g0-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41598,8 +41999,11 @@ all-stage3-target-libgcc: configure-stag
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS)" LIBCFLAGS=3D"$(STAGE3_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS)" CXXFLAGS=3D"$(STAGE3_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS)" $(EXTRA_TARGET_FLAGS)   \
+ 		$(TARGET-stage3-target-libgcc)
+=20
+ maybe-clean-stage3-target-libgcc: clean-stage3-target-libgcc
+@@ -41612,7 +42016,7 @@ clean-stage3-target-libgcc:
+ 	  $(MAKE) stage3-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41633,8 +42037,11 @@ all-stageb3g2-target-libgcc: configure-s
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" LIBCFLAGS=3D"$(STAGE3_CFLAGS) -g2"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -g2" CXXFLAGS=3D"$(STAGE3_CFLAGS) -g2" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -g2" $(EXTRA_TARGET_FLAGS)  =
 \
+ 		$(TARGET-stageb3g2-target-libgcc)
+=20
+ maybe-clean-stageb3g2-target-libgcc: clean-stageb3g2-target-libgcc
+@@ -41647,7 +42054,7 @@ clean-stageb3g2-target-libgcc:
+ 	  $(MAKE) stageb3g2-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41668,8 +42075,11 @@ all-stage4-target-libgcc: configure-stag
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE4_CFLAGS)" LIBCFLAGS=3D"$(STAGE4_CFLAGS)"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE4_CFLAGS)" CXXFLAGS=3D"$(STAGE4_CFLAGS)" \
++		LIBCFLAGS=3D"$(STAGE4_CFLAGS)" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE4_CFLAGS)" $(EXTRA_TARGET_FLAGS)   \
+ 		$(TARGET-stage4-target-libgcc)
+=20
+ maybe-clean-stage4-target-libgcc: clean-stage4-target-libgcc
+@@ -41682,7 +42092,7 @@ clean-stage4-target-libgcc:
+ 	  $(MAKE) stage4-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41703,8 +42113,11 @@ all-stageprofile-target-libgcc: configur
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" LIBCFLAGS=3D"$(STAGE2_CF=
LAGS) -fprofile-generate"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE2_CFLAGS) -fprofile-generate" CXXFLAGS=3D"$(STAGE2_CFL=
AGS) -fprofile-generate" \
++		LIBCFLAGS=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE2_LIBCFLAGS) -fprofile-generate" $(EXTRA_=
TARGET_FLAGS)   \
+ 		$(TARGET-stageprofile-target-libgcc)
+=20
+ maybe-clean-stageprofile-target-libgcc: clean-stageprofile-target-libgcc
+@@ -41717,7 +42130,7 @@ clean-stageprofile-target-libgcc:
+ 	  $(MAKE) stageprofile-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -41738,8 +42151,11 @@ all-stagefeedback-target-libgcc: configu
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	 \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS) \
+-		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" LIBCFLAGS=3D"$(STAGE3_CFLAGS)=
 -fprofile-use"   \
++	$(MAKE) $(BASE_FLAGS_TO_PASS) \
++		CFLAGS=3D"$(STAGE3_CFLAGS) -fprofile-use" CXXFLAGS=3D"$(STAGE3_CFLAGS) =
-fprofile-use" \
++		LIBCFLAGS=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" \
++		CXXFLAGS_FOR_TARGET=3D"$(STAGE3_LIBCFLAGS) -fprofile-use" $(EXTRA_TARGE=
T_FLAGS)   \
+ 		$(TARGET-stagefeedback-target-libgcc)
+=20
+ maybe-clean-stagefeedback-target-libgcc: clean-stagefeedback-target-libgc=
c
+@@ -41752,7 +42168,7 @@ clean-stagefeedback-target-libgcc:
+ 	  $(MAKE) stagefeedback-start; \
+ 	fi; \
+ 	cd $(TARGET_SUBDIR)/libgcc && \
+-	$(MAKE) $(TARGET_FLAGS_TO_PASS)  \
++	$(MAKE) $(EXTRA_TARGET_FLAGS)  \
+ 		  \
+ 		 clean
+ @endif target-libgcc-bootstrap
+@@ -42191,7 +42607,8 @@ all-target-libgfortran: configure-target
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libgfortran && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libgfortran))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libgfortran))
+ @endif target-libgfortran
+=20
+=20
+@@ -42632,7 +43049,8 @@ all-target-libobjc: configure-target-lib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libobjc && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libobjc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libobjc))
+ @endif target-libobjc
+=20
+=20
+@@ -43073,7 +43491,8 @@ all-target-libtermcap: configure-target-
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libtermcap && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libtermcap))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libtermcap))
+ @endif target-libtermcap
+=20
+=20
+@@ -43449,7 +43868,8 @@ all-target-winsup: configure-target-wins
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/winsup && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-winsup))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-winsup))
+ @endif target-winsup
+=20
+=20
+@@ -43890,7 +44310,8 @@ all-target-libgloss: configure-target-li
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libgloss && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libgloss))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libgloss))
+ @endif target-libgloss
+=20
+=20
+@@ -44326,7 +44747,8 @@ all-target-libiberty: configure-target-l
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libiberty && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libiberty))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libiberty))
+ @endif target-libiberty
+=20
+=20
+@@ -44767,7 +45189,8 @@ all-target-gperf: configure-target-gperf
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/gperf && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-gperf))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-gperf))
+ @endif target-gperf
+=20
+=20
+@@ -45208,7 +45631,8 @@ all-target-examples: configure-target-ex
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/examples && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-examples))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-examples))
+ @endif target-examples
+=20
+=20
+@@ -45639,7 +46063,8 @@ all-target-libffi: configure-target-libf
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libffi && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libffi))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libffi))
+ @endif target-libffi
+=20
+=20
+@@ -46080,7 +46505,8 @@ all-target-libjava: configure-target-lib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(RAW_CXX_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libjava && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS) 'CXX=3D$$(RAW_CXX_FOR_TARGET)' 'CXX_FO=
R_TARGET=3D$$(RAW_CXX_FOR_TARGET)'  $(TARGET-target-libjava))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS) 'CXX=3D$$(RAW_CXX_=
FOR_TARGET)' 'CXX_FOR_TARGET=3D$$(RAW_CXX_FOR_TARGET)'  \
++		$(TARGET-target-libjava))
+ @endif target-libjava
+=20
+=20
+@@ -46521,7 +46947,8 @@ all-target-zlib: configure-target-zlib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/zlib && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-zlib))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-zlib))
+ @endif target-zlib
+=20
+=20
+@@ -46962,7 +47389,8 @@ all-target-boehm-gc: configure-target-bo
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/boehm-gc && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-boehm-gc))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-boehm-gc))
+ @endif target-boehm-gc
+=20
+=20
+@@ -47403,7 +47831,8 @@ all-target-qthreads: configure-target-qt
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/qthreads && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-qthreads))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-qthreads))
+ @endif target-qthreads
+=20
+=20
+@@ -47844,7 +48273,8 @@ all-target-rda: configure-target-rda
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/rda && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-rda))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-rda))
+ @endif target-rda
+=20
+=20
+@@ -48285,7 +48715,8 @@ all-target-libada: configure-target-liba
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libada && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libada))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libada))
+ @endif target-libada
+=20
+=20
+@@ -48726,7 +49157,8 @@ all-target-libgomp: configure-target-lib
+ 	s=3D`cd $(srcdir); ${PWD_COMMAND}`; export s; \
+ 	$(NORMAL_TARGET_EXPORTS) \
+ 	(cd $(TARGET_SUBDIR)/libgomp && \
+-	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libgomp))
++	  $(MAKE) $(BASE_FLAGS_TO_PASS) $(EXTRA_TARGET_FLAGS)  \
++		$(TARGET-target-libgomp))
+ @endif target-libgomp
+=20
+=20
+Index: gcc-4.3.1/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gcc-4.3.1.orig/configure	2008-02-01 19:29:30.000000000 -0800
++++ gcc-4.3.1/configure	2008-07-21 11:22:34.000000000 -0700
+@@ -272,7 +272,7 @@ PACKAGE_STRING=3D
+ PACKAGE_BUGREPORT=3D
+=20
+ ac_unique_file=3D"move-if-change"
+-ac_subst_vars=3D'SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAG=
E_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_trans=
form_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir local=
statedir libdir includedir oldincludedir infodir mandir build_alias host_al=
ias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS build build_cpu build_vendo=
r build_os build_noncanonical host_noncanonical target_noncanonical host ho=
st_cpu host_vendor host_os target target_cpu target_vendor target_os INSTAL=
L_PROGRAM INSTALL_SCRIPT INSTALL_DATA LN LN_S TOPLEVEL_CONFIGURE_ARGUMENTS =
build_libsubdir build_subdir host_subdir target_subdir CC CFLAGS LDFLAGS CP=
PFLAGS ac_ct_CC EXEEXT OBJEXT CXX CXXFLAGS ac_ct_CXX GNATBIND ac_ct_GNATBIN=
D GNATMAKE ac_ct_GNATMAKE do_compare gmplibs gmpinc stage1_languages SYSROO=
T_CFLAGS_FOR_TARGET DEBUG_PREFIX_CFLAGS_FOR_TARGET RPATH_ENVVAR tooldir bui=
ld_tooldir CONFIGURE_GDB_TK GDB_TK INSTALL_GDB_TK build_configargs build_co=
nfigdirs host_configargs configdirs target_configargs AR_FOR_BUILD AS_FOR_B=
UILD CC_FOR_BUILD CFLAGS_FOR_BUILD CXXFLAGS_FOR_BUILD CXX_FOR_BUILD DLLTOOL=
_FOR_BUILD GCJ_FOR_BUILD GFORTRAN_FOR_BUILD LDFLAGS_FOR_BUILD LD_FOR_BUILD =
NM_FOR_BUILD RANLIB_FOR_BUILD WINDMC_FOR_BUILD WINDRES_FOR_BUILD config_she=
ll YACC BISON M4 LEX FLEX MAKEINFO EXPECT RUNTEST AR AS DLLTOOL LD LIPO NM =
RANLIB STRIP WINDRES WINDMC OBJCOPY OBJDUMP CC_FOR_TARGET CXX_FOR_TARGET GC=
C_FOR_TARGET GCJ_FOR_TARGET GFORTRAN_FOR_TARGET AR_FOR_TARGET AS_FOR_TARGET=
 DLLTOOL_FOR_TARGET LD_FOR_TARGET LIPO_FOR_TARGET NM_FOR_TARGET OBJDUMP_FOR=
_TARGET RANLIB_FOR_TARGET STRIP_FOR_TARGET WINDRES_FOR_TARGET WINDMC_FOR_TA=
RGET RAW_CXX_FOR_TARGET FLAGS_FOR_TARGET COMPILER_AS_FOR_TARGET COMPILER_LD=
_FOR_TARGET COMPILER_NM_FOR_TARGET MAINTAINER_MODE_TRUE MAINTAINER_MODE_FAL=
SE MAINT stage1_cflags stage1_checking stage2_werror_flag datarootdir docdi=
r pdfdir htmldir LIBOBJS LTLIBOBJS'
++ac_subst_vars=3D'SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAG=
E_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_trans=
form_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir local=
statedir libdir includedir oldincludedir infodir mandir build_alias host_al=
ias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS build build_cpu build_vendo=
r build_os build_noncanonical host_noncanonical target_noncanonical host ho=
st_cpu host_vendor host_os target target_cpu target_vendor target_os INSTAL=
L_PROGRAM INSTALL_SCRIPT INSTALL_DATA LN LN_S TOPLEVEL_CONFIGURE_ARGUMENTS =
build_libsubdir build_subdir host_subdir target_subdir CC CFLAGS LDFLAGS CP=
PFLAGS ac_ct_CC EXEEXT OBJEXT CXX CXXFLAGS ac_ct_CXX GNATBIND ac_ct_GNATBIN=
D GNATMAKE ac_ct_GNATMAKE do_compare gmplibs gmpinc stage1_languages SYSROO=
T_CFLAGS_FOR_TARGET DEBUG_PREFIX_CFLAGS_FOR_TARGET CFLAGS_FOR_TARGET CXXFLA=
GS_FOR_TARGET RPATH_ENVVAR tooldir build_tooldir CONFIGURE_GDB_TK GDB_TK IN=
STALL_GDB_TK build_configargs build_configdirs host_configargs configdirs t=
arget_configargs AR_FOR_BUILD AS_FOR_BUILD CC_FOR_BUILD CFLAGS_FOR_BUILD CX=
XFLAGS_FOR_BUILD CXX_FOR_BUILD DLLTOOL_FOR_BUILD GCJ_FOR_BUILD GFORTRAN_FOR=
_BUILD LDFLAGS_FOR_BUILD LD_FOR_BUILD NM_FOR_BUILD RANLIB_FOR_BUILD WINDMC_=
FOR_BUILD WINDRES_FOR_BUILD config_shell YACC BISON M4 LEX FLEX MAKEINFO EX=
PECT RUNTEST AR AS DLLTOOL LD LIPO NM RANLIB STRIP WINDRES WINDMC OBJCOPY O=
BJDUMP CC_FOR_TARGET CXX_FOR_TARGET GCC_FOR_TARGET GCJ_FOR_TARGET GFORTRAN_=
FOR_TARGET AR_FOR_TARGET AS_FOR_TARGET DLLTOOL_FOR_TARGET LD_FOR_TARGET LIP=
O_FOR_TARGET NM_FOR_TARGET OBJDUMP_FOR_TARGET RANLIB_FOR_TARGET STRIP_FOR_T=
ARGET WINDRES_FOR_TARGET WINDMC_FOR_TARGET RAW_CXX_FOR_TARGET FLAGS_FOR_TAR=
GET COMPILER_AS_FOR_TARGET COMPILER_LD_FOR_TARGET COMPILER_NM_FOR_TARGET MA=
INTAINER_MODE_TRUE MAINTAINER_MODE_FALSE MAINT stage1_cflags stage1_checkin=
g stage2_werror_flag datarootdir docdir pdfdir htmldir LIBOBJS LTLIBOBJS'
+ ac_subst_files=3D'serialization_dependencies host_makefile_frag target_ma=
kefile_frag alphaieee_frag ospace_frag'
+=20
+ # Initialize some variables set by options.
+@@ -5147,6 +5147,38 @@ else
+ fi;
+=20
+=20
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path)=
.
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" =3D x; then
++  CFLAGS_FOR_TARGET=3D$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
++  esac
++fi
++
++
++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
++  esac
++fi
++
++
+ # Handle --with-headers=3DXXX.  If the value is not "yes", the contents o=
f
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno ; t=
hen
+@@ -12825,6 +12857,8 @@ s,@gmpinc@,$gmpinc,;t t
+ s,@stage1_languages@,$stage1_languages,;t t
+ s,@SYSROOT_CFLAGS_FOR_TARGET@,$SYSROOT_CFLAGS_FOR_TARGET,;t t
+ s,@DEBUG_PREFIX_CFLAGS_FOR_TARGET@,$DEBUG_PREFIX_CFLAGS_FOR_TARGET,;t t
++s,@CFLAGS_FOR_TARGET@,$CFLAGS_FOR_TARGET,;t t
++s,@CXXFLAGS_FOR_TARGET@,$CXXFLAGS_FOR_TARGET,;t t
+ s,@RPATH_ENVVAR@,$RPATH_ENVVAR,;t t
+ s,@tooldir@,$tooldir,;t t
+ s,@build_tooldir@,$build_tooldir,;t t
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate.inc	3fd758b824b19229a3f6e7df95246f0=
d382bc7ea
+++ packages/gcc/gcc-cross-intermediate.inc	3fd758b824b19229a3f6e7df95246f0=
d382bc7ea
@@ -0,0 +1,21 @@
+DEPENDS =3D "virtual/${TARGET_PREFIX}binutils"
+DEPENDS +=3D "virtual/${TARGET_PREFIX}libc-initial"
+PROVIDES =3D "virtual/${TARGET_PREFIX}gcc-intermediate"
+PACKAGES =3D ""
+
+# This is intended to be a -very- basic config
+# sysroot is needed in case we use libc-initial
+EXTRA_OECONF =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${layout_pref=
ix} \
+		--enable-shared \
+		--disable-multilib \
+		--disable-threads \
+		--enable-languages=3Dc \
+		--enable-target-optspace \
+		--program-prefix=3D${TARGET_PREFIX} \
+		--with-sysroot=3D${STAGING_DIR_TARGET} \
+		--with-build-sysroot=3D${STAGING_DIR_TARGET} \
+		${@get_gcc_fpu_setting(bb, d)}"
+
+do_install () {
+	:
+}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_3.3.3.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.3.3.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_3.3.4.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.3.4.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_3.4.3.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.4.3.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_3.4.4.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.4.4.bb	65e5d97bbf12d5db9a90b7522e=
39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.0.2.bb	d6632d3d523fcb2d4e71bab2c5=
a7effd7c819ba5
+++ packages/gcc/gcc-cross-intermediate_4.0.2.bb	d6632d3d523fcb2d4e71bab2c5=
a7effd7c819ba5
@@ -0,0 +1,4 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-multilib"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.1.0.bb	211f0593c75ca9fb9078df3e4a=
57d18d80e1385f
+++ packages/gcc/gcc-cross-intermediate_4.1.0.bb	211f0593c75ca9fb9078df3e4a=
57d18d80e1385f
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.1.1.bb	3fc0ba21af09070a730a4b3e0b=
726ee8918c8f65
+++ packages/gcc/gcc-cross-intermediate_4.1.1.bb	3fc0ba21af09070a730a4b3e0b=
726ee8918c8f65
@@ -0,0 +1,6 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap \
+		--disable-libunwind-exceptions \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.1.2.bb	211f0593c75ca9fb9078df3e4a=
57d18d80e1385f
+++ packages/gcc/gcc-cross-intermediate_4.1.2.bb	211f0593c75ca9fb9078df3e4a=
57d18d80e1385f
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.2.1.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.1.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.2.2.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.2.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.2.3.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.3.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9=
b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF +=3D "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_4.3.1.bb	30ce0ad3e7c44f2ebfbeb6ee12=
d62890fbc34086
+++ packages/gcc/gcc-cross-intermediate_4.3.1.bb	30ce0ad3e7c44f2ebfbeb6ee12=
d62890fbc34086
@@ -0,0 +1,14 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+DEPENDS +=3D "gmp-native mpfr-native"
+
+EXTRA_OECONF +=3D " --disable-libmudflap \
+		  --disable-libgomp \
+		  --disable-libssp"
+
+# Hack till we fix *libc properly
+do_stage_append() {
+        ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* =
${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb	bdfa3b2a9bb38d911=
fcba484a8f6a57ab9c6a6d8
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb	bdfa3b2a9bb38d911=
fcba484a8f6a57ab9c6a6d8
@@ -0,0 +1,2 @@
+require gcc-cross_csl-arm-2005q3.bb
+require gcc-cross-intermediate.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb	7ca0df097d7377b3d=
3e86f9ab60edc17327fc874
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb	7ca0df097d7377b3d=
3e86f9ab60edc17327fc874
@@ -0,0 +1,7 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S =3D "${WORKDIR}/gcc-2006q1"
+
+EXTRA_OECONF +=3D "--disable-libmudflap \
+		--disable-libssp"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb	b41165d11071d72ef=
03ff2bb5742b410f82555ab
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb	b41165d11071d72ef=
03ff2bb5742b410f82555ab
@@ -0,0 +1,12 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S =3D "${WORKDIR}/gcc-4.2"
+
+EXTRA_OECONF +=3D "--disable-libssp --disable-bootstrap --disable-libgomp =
--disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_stage_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS=
_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb	b41165d11071d72ef=
03ff2bb5742b410f82555ab
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb	b41165d11071d72ef=
03ff2bb5742b410f82555ab
@@ -0,0 +1,12 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S =3D "${WORKDIR}/gcc-4.2"
+
+EXTRA_OECONF +=3D "--disable-libssp --disable-bootstrap --disable-libgomp =
--disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_stage_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS=
_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/files/glibc-2.6.1-use-short-for-fnstsw.patch	cd6208674ca=
556cef23fcfe071a929d4c768e68f
+++ packages/glibc/files/glibc-2.6.1-use-short-for-fnstsw.patch	cd6208674ca=
556cef23fcfe071a929d4c768e68f
@@ -0,0 +1,30 @@
+Source: http://sourceware.org/ml/libc-alpha/2008-01/msg00017.html
+
+I am checking this x86 assembler patch:
+
+http://sourceware.org/ml/binutils/2008-01/msg00148.html
+
+to check operand size. fnstsw stores 16bit into %ax. The upper
+16bit of %eax is unchanged.  The new assembler will disallow
+"fnstsw %eax".  Here is a patch for glibc.
+
+
+H.J.
+
+---
+ sysdeps/i386/fpu/ftestexcept.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: glibc-2.6.1/sysdeps/i386/fpu/ftestexcept.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glibc-2.6.1.orig/sysdeps/i386/fpu/ftestexcept.c	2008-07-19 11:00:45.00=
0000000 -0700
++++ glibc-2.6.1/sysdeps/i386/fpu/ftestexcept.c	2008-07-19 11:01:25.0000000=
00 -0700
+@@ -26,7 +26,7 @@
+ int
+ fetestexcept (int excepts)
+ {
+-  int temp;
++  short temp;
+   int xtemp =3D 0;
+=20
+   /* Get current exceptions.  */
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-raise.patch=
	1233a371e51da2cb27c42ec18bc33f11a9288f28
+++ packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-raise.patch=
	1233a371e51da2cb27c42ec18bc33f11a9288f28
@@ -0,0 +1,37 @@
+--- glibc-2.3.6/linuxthreads/sysdeps/unix/sysv/linux/raise.c.org	2008-07-1=
6 22:57:58.000000000 -0700
++++ glibc-2.3.6/linuxthreads/sysdeps/unix/sysv/linux/raise.c	2008-07-16 22=
:58:26.000000000 -0700
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 1991, 1996, 2002, 2003 Free Software Foundation, Inc.
++/* Copyright (C) 1991, 1996, 2002, 2003, 2005 Free Software Foundation, I=
nc.
+    This file is part of the GNU C Library.
+=20
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -18,10 +18,13 @@
+=20
+ #include <signal.h>
+ #include <unistd.h>
+-#include <bits/libc-lock.h>
+=20
+-#ifndef SHARED
++#ifndef IS_IN_rtld
++# include <bits/libc-lock.h>
++
++# ifndef SHARED
+ weak_extern (__pthread_raise)
++# endif
+ #endif
+=20
+ /* Raise the signal SIG.  */
+@@ -29,8 +32,12 @@ int
+ raise (sig)
+      int sig;
+ {
++#ifdef IS_IN_rtld
++  return __kill (__getpid (), sig);
++#else
+   return __libc_maybe_call2 (pthread_raise, (sig),
+ 			     __kill (__getpid (), sig));
++#endif
+ }
+ libc_hidden_def (raise)
+ weak_alias (raise, gsignal)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch	3cb1771cb1f=
fb55fd118435cae54bade8a5c7d4e
+++ packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch	3cb1771cb1f=
fb55fd118435cae54bade8a5c7d4e
@@ -0,0 +1,45 @@
+This one was taken from debian.
+
+# DP: Description: Fix __bind redefinition problem
+# DP: Related bugs:=20
+# DP: Dpatch author: Phil Blundell
+# DP: Patch author: Daniel Jacobowitz
+# DP: Upstream status: In CVS
+# DP: Status Details:
+# DP: Date: 2005-12-25
+
+Index: sysdeps/unix/sysv/linux/arm/socket.S
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/arm/socket.S,v
+retrieving revision 1.12
+retrieving revision 1.13
+diff -u -r1.12 -r1.13
+--- glibc-2.3.6.ds1.orig/sysdeps/unix/sysv/linux/arm/socket.S	4 Dec 2004 2=
1:20:16 -0000	1.12
++++ glibc-2.3.6.ds1/sysdeps/unix/sysv/linux/arm/socket.S	27 Oct 2005 18:50=
:12 -0000	1.13
+@@ -1,4 +1,6 @@
+-/* Copyright (C) 1995, 1996, 1997, 1998, 2003 Free Software Foundation, I=
nc.
++/* Copyright (C) 1995, 1996, 1997, 1998, 2003, 2004, 2005
++   Free Software Foundation, Inc.
++
+    This file is part of the GNU C Library.
+=20
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -32,7 +34,11 @@
+    The .S files for the other calls just #define socket and #include this=
.  */
+=20
+ #ifndef __socket
++#ifndef NO_WEAK_ALIAS
+ #define __socket P(__,socket)
++#else
++#define __socket socket
++#endif
+ #endif
+=20
+ #define PUSHARGS_1	str a1, [sp, $-4]!
+@@ -120,4 +126,6 @@
+=20
+ PSEUDO_END (__socket)
+=20
++#ifndef NO_WEAK_ALIAS
+ weak_alias (__socket, socket)
++#endif
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.3.6/glibc-cross_sunrpc.patch	59253459fc269a11bbb=
26d9f5e7a42b6871fd287
+++ packages/glibc/glibc-2.3.6/glibc-cross_sunrpc.patch	59253459fc269a11bbb=
26d9f5e7a42b6871fd287
@@ -0,0 +1,79 @@
+Fix rpcsvc headers missing from glibc, also
+allows glibc to produce the rpc headers when cross compiling,
+And fix for glibc-bootstrap package doesn't currently build because the
+generated sunrpc headers are not available
+   =20
+
+---
+ sunrpc/Makefile |   28 ++++++++++++++++++++++++----
+ 1 file changed, 24 insertions(+), 4 deletions(-)
+
+Index: glibc-2.3.6/sunrpc/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glibc-2.3.6.orig/sunrpc/Makefile	2005-07-17 20:03:49.000000000 -0700
++++ glibc-2.3.6/sunrpc/Makefile	2008-07-17 15:28:04.000000000 -0700
+@@ -75,6 +75,8 @@ install-sbin :=3D rpcinfo
+ rpcgen-objs =3D rpc_main.o rpc_hout.o rpc_cout.o rpc_parse.o \
+ 	      rpc_scan.o rpc_util.o rpc_svcout.o rpc_clntout.o \
+ 	      rpc_tblout.o rpc_sample.o
++host-rpcgen-objs =3D $(addprefix host-,$(rpcgen-objs))
++
+ # These headers are part of rpcgen.
+ distribute :=3D proto.h rpc_util.h rpc_parse.h rpc_scan.h \
+ 	      $(rpcgen-objs:.o=3D.c) etc.rpc \
+@@ -98,8 +100,8 @@ otherlibs +=3D $(nssobjdir)/libnss_files.a
+ 	     $(resolvobjdir)/libresolv.a
+ endif
+=20
+-ifeq (no,$(cross-compiling))
+-# We can only build this library if we can run the rpcgen we build.
++ifneq (,$(findstring subdir_install,$(MAKECMDGOALS)))
++## We can only build this library if we can run the rpcgen we build.
+ headers +=3D $(rpcsvc:%.x=3Drpcsvc/%.h)
+ extra-libs :=3D librpcsvc
+ extra-libs-others :=3D librpcsvc # Make it in `others' pass, not `lib' pa=
ss.
+@@ -144,8 +146,26 @@ cpp-srcs-left :=3D $(rpcgen-objs:.o=3D.c)
+ lib :=3D nonlib
+ include $(patsubst %,$(..)cppflags-iterator.mk,$(cpp-srcs-left))
+=20
++# Rely on the target rpcgen objects for dependency information.
++$(objpfx)host-%.o: %.c $(objpfx)%.o
++	$(patsubst %/,cd % &&,$(objpfx)) \
++	$(BUILD_CC) $($(basename $(<F))-CFLAGS) \
++		-I$(shell cd .. && pwd) \
++		-Dattribute_hidden=3D \
++		-include $(shell cd ../include && pwd)/libintl.h \
++		-O2 $(ALL_BUILD_CFLAGS) $(shell pwd)/$(<F) -c -o $(@F)
++
++$(objpfx)host-rpcgen: $(addprefix $(objpfx),$(host-rpcgen-objs))
++	$(BUILD_CC) $(BUILD_CFLAGS) $+ -o $(objpfx)host-rpcgen
++
+ # Tell rpcgen where to find the C preprocessor.
++ifeq ($(cross-compiling),no)
+ rpcgen-cmd =3D CPP=3D'$(CC) -E -x c-header' $(built-program-cmd) -Y ../sc=
ripts
++rpcgen-prog =3D $(objpfx)rpcgen
++else
++rpcgen-cmd =3D CPP=3D'$(CC) -E -x c-header' $(objpfx)host-rpcgen -Y ../sc=
ripts
++rpcgen-prog =3D $(objpfx)host-rpcgen
++endif
+=20
+ # Install the rpc data base file.
+ $(inst_sysconfdir)/rpc: etc.rpc $(+force)
+@@ -156,7 +176,7 @@ $(inst_sysconfdir)/rpc: etc.rpc $(+force
+ # relinked.
+ $(rpcsvc:%.x=3D$(objpfx)rpcsvc/%.h): $(objpfx)rpcsvc/%.h: $(objpfx)rpcsvc=
/%.stmp
+ 	@:
+-$(objpfx)rpcsvc/%.stmp: rpcsvc/%.x $(objpfx)rpcgen
++$(objpfx)rpcsvc/%.stmp: rpcsvc/%.x $(rpcgen-prog)
+ 	$(make-target-directory)
+ 	-@rm -f ${@:stmp=3DT} $@
+ 	$(rpcgen-cmd) -h $< -o ${@:stmp=3DT}
+@@ -166,7 +186,7 @@ $(objpfx)rpcsvc/%.stmp: rpcsvc/%.x $(obj
+ # Generate the rpcsvc XDR functions with rpcgen.
+ $(rpcsvc:%.x=3D$(objpfx)x%.c): $(objpfx)x%.c: $(objpfx)x%.stmp
+ 	@:
+-$(objpfx)x%.stmp: rpcsvc/%.x $(objpfx)rpcgen
++$(objpfx)x%.stmp: rpcsvc/%.x $(rpcgen-prog)
+ 	-@rm -f ${@:stmp=3DT} $@
+ 	$(rpcgen-cmd) -c $< -o ${@:stmp=3DT}
+ 	$(move-if-change) $(@:stmp=3DT) $(@:stmp=3Dc)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.3.6/glibc-memusage.patch	2a58393c519f5c0ba7293bd=
d4643302367f2845d
+++ packages/glibc/glibc-2.3.6/glibc-memusage.patch	2a58393c519f5c0ba7293bd=
d4643302367f2845d
@@ -0,0 +1,44 @@
+---
+ malloc/Makefile    |    4 +++-
+ malloc/memusage.sh |    6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+Index: glibc-2.3.6/malloc/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glibc-2.3.6.orig/malloc/Makefile	2008-07-17 14:40:54.000000000 -0700
++++ glibc-2.3.6/malloc/Makefile	2008-07-17 14:42:07.000000000 -0700
+@@ -80,7 +80,7 @@ ifneq ($(cross-compiling),yes)
+ ifneq ($(LIBGD),no)
+ install-bin =3D memusagestat
+ install-bin-script +=3D memusage
+-generated +=3D memusagestat memusage
++generated +=3D memusagestat
+ extra-objs +=3D memusagestat.o
+=20
+ # The configure.in check for libgd and its headers did not use $SYSINCLUD=
ES.
+@@ -90,6 +90,8 @@ extra-objs +=3D memusagestat.o
+ $(objpfx)memusagestat.o: sysincludes =3D # nothing
+ endif
+ endif
++install-bin-script +=3D memusage
++generated +=3D memusage
+=20
+ # Another goal which can be used to override the configure decision.
+ .PHONY: do-memusagestat
+Index: glibc-2.3.6/malloc/memusage.sh
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glibc-2.3.6.orig/malloc/memusage.sh	2008-07-17 14:42:17.000000000 -070=
0
++++ glibc-2.3.6/malloc/memusage.sh	2008-07-17 14:42:54.000000000 -0700
+@@ -205,6 +205,12 @@ if test $# -eq 0; then
+   do_usage
+ fi
+=20
++# Find memusagestat.
++if test -n "$png" -a ! -x $memusagestat; then
++  echo >&2 $"PNG generation is not supported."
++  png=3D""
++fi
++
+ # This will be in the environment.
+ add_env=3D"LD_PRELOAD=3D$memusageso"
+=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch	f31f3425ae1f8afcb8=
69cd8e0f3c414d01aa211f
+++ packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch	f31f3425ae1f8afcb8=
69cd8e0f3c414d01aa211f
@@ -0,0 +1,25 @@
+---
+ elf/Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: glibc-2.3.6/elf/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glibc-2.3.6.orig/elf/Makefile	2008-07-17 01:10:39.000000000 -0700
++++ glibc-2.3.6/elf/Makefile	2008-07-17 01:17:18.000000000 -0700
+@@ -279,7 +279,7 @@ $(objpfx)rtld-libc.a: $(objpfx)librtld.m
+ 	$(MAKE) -f $< -f rtld-Rules
+=20
+ $(objpfx)librtld.os: $(objpfx)dl-allobjs.os $(objpfx)rtld-libc.a
+-	$(LINK.o) -nostdlib -nostartfiles -r -o $@ '-Wl,-(' $^ -lgcc '-Wl,-)' \
++	$(LINK.o) -nostdlib -nostartfiles -r -o $@ '-Wl,-(' $^ -lgcc -lgcc_eh '-=
Wl,-)' \
+ 		  -Wl,-Map,$@.map
+=20
+ generated +=3D librtld.map librtld.mk rtld-libc.a librtld.os.map
+@@ -295,6 +295,7 @@ $(objpfx)ld.so: $(objpfx)librtld.os $(ld
+ 		      -e 's/\. =3D 0 + SIZEOF_HEADERS;/& _begin =3D . - SIZEOF_HEADERS;=
/' \
+ 		  > $@.lds
+ 	$(LINK.o) -nostdlib -nostartfiles -shared -o $@			\
++		  -lgcc -lgcc_eh					\
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs $(z-now-$(bind-now))	\
+ 		  $(filter-out $(map-file),$^) $(load-map-file)		\
+ 		  -Wl,-soname=3D$(rtld-installed-name) -T $@.lds
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-2.7/all_glibc-i586-chk.patch	5adb32eb0f211aa8fca2f=
cb25d68b7dbbce3d121
+++ packages/glibc/glibc-2.7/all_glibc-i586-chk.patch	5adb32eb0f211aa8fca2f=
cb25d68b7dbbce3d121
@@ -0,0 +1,33 @@
+http://bugs.gentoo.org/199479
+
+2007-09-13  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* sysdeps/i386/i586/memcpy_chk.S: New file.
+	* sysdeps/i386/i586/mempcpy_chk.S: Likewise.
+	* sysdeps/i386/i586/memset_chk.S: Likewise.
+
+Index: glibc/sysdeps/i386/i586/memcpy_chk.S
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: sysdeps/i386/i586/memcpy_chk.S
+diff -N sysdeps/i386/i586/memcpy_chk.S
+--- /dev/null	1 Jan 1970 00:00:00 -0000
++++ glibc/sysdeps/i386/i586/memcpy_chk.S	13 Nov 2007 01:56:18 -0000	1.1
+@@ -0,0 +1 @@
++#include <sysdeps/i386/i686/memcpy_chk.S>
+Index: glibc/sysdeps/i386/i586/mempcpy_chk.S
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: sysdeps/i386/i586/mempcpy_chk.S
+diff -N sysdeps/i386/i586/mempcpy_chk.S
+--- /dev/null	1 Jan 1970 00:00:00 -0000
++++ glibc/sysdeps/i386/i586/mempcpy_chk.S	13 Nov 2007 01:56:18 -0000	1.1
+@@ -0,0 +1 @@
++#include <sysdeps/i386/i686/mempcpy_chk.S>
+Index: glibc/sysdeps/i386/i586/memset_chk.S
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: sysdeps/i386/i586/memset_chk.S
+diff -N sysdeps/i386/i586/memset_chk.S
+--- /dev/null	1 Jan 1970 00:00:00 -0000
++++ glibc/sysdeps/i386/i586/memset_chk.S	13 Nov 2007 01:56:18 -0000	1.1
+@@ -0,0 +1 @@
++#include <sysdeps/i386/i686/memset_chk.S>
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/angstrom-2008.1.conf	f64ebcf55e85b504d3be169befac3c7981aa74=
d9
+++ conf/distro/angstrom-2008.1.conf	dd3ab976c49eec5fbb5e9e740aa8dfe99aa64f=
a6
@@ -71,7 +71,6 @@ PREFERRED_VERSION_glibc 		?=3D "2.6.1"
=20
 #Prefer glibc 2.6 and uclibc 0.9.29, these have had the most testing.
 PREFERRED_VERSION_glibc 		?=3D "2.6.1"
-PREFERRED_VERSION_glibc-intermediate 	?=3D "2.6.1"
 PREFERRED_VERSION_glibc-initial 	?=3D "2.6.1"
=20
 #Prefer a newer GTK+ and friends
@@ -103,12 +102,14 @@ ANGSTROM_GCC_VERSION_avr32		?=3D "4.2.2"
 ANGSTROM_GCC_VERSION_avr32		?=3D "4.2.2"
=20
 #Everybody else can just use this:=20
-ANGSTROM_GCC_VERSION 			?=3D "4.2.4"
+ANGSTROM_GCC_VERSION 			?=3D "4.3.1"
+#PREFERRED_VERSION_binutils-cross 	?=3D "2.18"
=20
-PREFERRED_VERSION_gcc               ?=3D "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross         ?=3D "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross-sdk     ?=3D "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross-initial ?=3D "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc                    ?=3D "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross              ?=3D "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-sdk          ?=3D "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-initial      ?=3D "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "${ANGSTROM_GCC_VERSION}"
=20
 #Loads preferred versions from files, these have weak assigments (?=3D), s=
o put them at the bottom
 require conf/distro/include/preferred-gpe-versions-2.8.inc
@@ -123,6 +124,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-init=
ial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cross=
-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/celinux-test.conf	89d7e451fc9af9bf40690f40acee9b8634d4239f
+++ conf/distro/celinux-test.conf	1405fee6f781db757cd0819b219abd9f47fc4b93
@@ -35,6 +35,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 # toolchain
 #
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}binutils:binutils-cross=
"
@@ -46,6 +47,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "3
 PREFERRED_VERSION_gcc =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.4"
=20
 PREFERRED_VERSION_glibc =3D "2.3.5+cvs20050627"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/chinook-compat.conf	6792236a4e268fbe64e7adc994afef1224f52c9=
a
+++ conf/distro/chinook-compat.conf	19281a425235c6217a5de40204e18655583cf00=
1
@@ -42,14 +42,15 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 MACHINE_KERNEL_VERSION =3D "2.6"
=20
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
 PREFERRED_PROVIDER_virtual/libc =3D "glibc"
=20
 # NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc =3D "glibc-inter=
mediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc =3D "glibc"
=20
 PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-binutils =3D "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-header =3D "linux-libc-headers"
@@ -64,6 +65,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "4
 PREFERRED_VERSION_gcc =3D "3.4.4cs2005q3.2"
 PREFERRED_VERSION_gcc-cross =3D "3.4.4cs2005q3.2"
 PREFERRED_VERSION_gcc-cross-initial =3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "4.1.1"
=20
 #PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4cs2005q3.2"
=20
@@ -71,7 +73,6 @@ PREFERRED_VERSION_glibc =3D "2.5"
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.20"
=20
 PREFERRED_VERSION_glibc =3D "2.5"
-PREFERRED_VERSION_glibc-intermediate =3D "2.5"
 PREFERRED_VERSION_glibc-initial =3D "2.5"
=20
 PREFERRED_VERSION_libtool =3D "1.5.6"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/gmustix.conf	88db2db3032412eac284ef6efa7a4668c79a29b2
+++ conf/distro/gmustix.conf	e5a0ed1602a23b5cbddbee1a07669efa041cd191
@@ -8,6 +8,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 IMAGE_FSTYPES =3D "jffs2"
=20
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
@@ -15,6 +16,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "3
 PREFERRED_PROVIDER_classpath =3D "classpath-minimal"
=20
 PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk =3D "3.4.4"=20
 PREFERRED_VERSION_gcc =3D "3.4.4"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/angstrom-2007-for-openmoko.inc	4e926bdf5178cce4d068=
eeb210aba5adf7982351
+++ conf/distro/include/angstrom-2007-for-openmoko.inc	85b9d88526b7e40205f1=
3f547c01c721f42fa32f
@@ -89,21 +89,25 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_gcc-cross         ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk     ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.2"
=20
 PREFERRED_VERSION_gcc_dht-walnut               ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross_dht-walnut         ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_dht-walnut     ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_dht-walnut ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_dht-walnut ?=3D "4.1.1"
=20
 PREFERRED_VERSION_gcc_xilinx-ml403               ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross_xilinx-ml403         ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_xilinx-ml403     ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_xilinx-ml403 ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_xilinx-ml403 ?=3D "4.1.1"
=20
 PREFERRED_VERSION_gcc_mpc8323e-rdb               ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross_mpc8323e-rdb         ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_mpc8323e-rdb     ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_mpc8323e-rdb ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_mpc8323e-rdb ?=3D "4.1.1"
=20
 PREFERRED_VERSION_binutils          ?=3D "2.18"
 PREFERRED_VERSION_binutils-cross    ?=3D "2.18"
@@ -115,6 +119,7 @@ PREFERRED_VERSION_gcc-cross-initial_avr3
 PREFERRED_VERSION_avr32-gcc-cross         =3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk_avr32     =3D "4.0.2"
 PREFERRED_VERSION_gcc-cross-initial_avr32 =3D "4.0.2"
+PREFERRED_VERSION_gcc-cross-intermediate_avr32 =3D "4.0.2"
=20
 PREFERRED_VERSION_binutils_avr32 =3D "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
@@ -133,9 +138,6 @@ PREFERRED_VERSION_uclibc-initial_avr32 =3D
 PREFERRED_VERSION_uclibc_avr32 =3D "0.9.28"
 PREFERRED_VERSION_uclibc-initial_avr32 =3D "0.9.28"
=20
-PREFERRED_VERSION_glibc-intermediate_i686 ?=3D "2.4"
-PREFERRED_VERSION_glibc-intermediate ?=3D "2.5"
-
 PREFERRED_VERSION_glibc-initial ?=3D "2.5"
=20
 # To use an EABI compatible version 3 series gcc, either uncomment=20
@@ -143,6 +145,7 @@ PREFERRED_VERSION_glibc-initial ?=3D "2.5"
 #
 # PREFERRED_VERSION_gcc-cross =3D "3.4.4+csl-arm-2005q3"
 # PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4+csl-arm-2005q3"
+# PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.4+csl-arm-2005q3"
=20
 #Loads preferred versions from files, these have weak assigments (?=3D), s=
o put them at the bottom
 require conf/distro/include/preferred-xorg-versions.inc
@@ -153,17 +156,17 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-init=
ial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cross=
-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
=20
 #Set preferred provider for the C library that is used to build the crossc=
ompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          =3D =
"glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          =3D =
"glibc"
=20
 PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc  =
  =3D "uclibc-initial"
 PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc=
  =3D "uclibc-initial"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/angstrom-eglibc.inc	e0e7b6758775be96c0a58faecff645b=
05ef7c3e2
+++ conf/distro/include/angstrom-eglibc.inc	e56df3f5a1f620f0dfa7795ff188661=
bf1524389
@@ -4,13 +4,13 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 PREFERRED_PROVIDER_virtual/libc =3D "eglibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D "eglibc-initia=
l"
=20
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc =
   =3D "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gc=
c  =3D "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc         =
   =3D "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc     =
   =3D "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc      =
   =3D "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc       =
   =3D "eglibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"eglibc"
+PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc =
   =3D "eglibc"
+PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gc=
c  =3D "eglibc"
+PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc         =
   =3D "eglibc"
+PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc     =
   =3D "eglibc"
+PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc      =
   =3D "eglibc"
+PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc       =
   =3D "eglibc"
=20
 TARGET_OS =3D "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) i=
n ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600'=
, 'h3800', 'simpad', 'htcwallaby']]}"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/angstrom-glibc.inc	64060b7ace4591e34cd8206bb5cd3ba7=
7c6554d4
+++ conf/distro/include/angstrom-glibc.inc	9a81308293772bcff0ea1b412e0fa3a4=
78a205fe
@@ -6,13 +6,13 @@ PREFERRED_PROVIDER_linux-libc-headers ?=3D
 PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
=20
 #Set preferred provider for the C library that is used to build the crossc=
ompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         =3D =
"glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          =3D =
"glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         =3D =
"glibc"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          =3D =
"glibc"
=20
=20
 TARGET_OS =3D "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) i=
n ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600'=
, 'h3800', 'simpad', 'htcwallaby']]}"
@@ -25,13 +25,11 @@ FULL_OPTIMIZATION_pn-perl =3D "-fexpensive
 FULL_OPTIMIZATION =3D "-fexpensive-optimizations -frename-registers -fomit=
-frame-pointer -Os"
=20
 FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O1"
-FULL_OPTIMIZATION_pn-glibc-intermediate =3D "-O2"
 FULL_OPTIMIZATION_pn-glibc =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O2"
 FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame-pointe=
r -frename-registers -O2"
=20
 BUILD_OPTIMIZATION =3D "-Os"
 BUILD_OPTIMIZATION_pn-perl =3D "-O1"
-BUILD_OPTIMIZATION_pn-glibc-intermediate =3D "-O2"
 BUILD_OPTIMIZATION_pn-glibc =3D "-O2"
 BUILD_OPTIMIZATION_sparc =3D "-O2"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/insane-srcrevs.inc	e685e3b620d54ebf0b096e4709ed95ca=
3329b08c
+++ conf/distro/include/insane-srcrevs.inc	cbc144484de6ac4d699d0a609a011f4f=
1f04d2bf
@@ -4,7 +4,6 @@ SRCREV_pn-eglibc-initial ?=3D "${AUTOREV}"
 SRCREV_pn-eds-dbus ?=3D "${AUTOREV}"
 SRCREV_pn-eglibc ?=3D "${AUTOREV}"
 SRCREV_pn-eglibc-initial ?=3D "${AUTOREV}"
-SRCREV_pn-eglibc-intermediate ?=3D "${AUTOREV}"
 SRCREV_pn-ezxd ?=3D "${AUTOREV}"
 SRCREV_pn-fbgrab-viewer-native ?=3D "${AUTOREV}"
 SRCREV_pn-fstests ?=3D "${AUTOREV}"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/sane-srcrevs.inc	3f7f64ecffb3a08b7d6d6b1dcbb873b77c=
474243
+++ conf/distro/include/sane-srcrevs.inc	fff789e4d1f239ac260c9e3632a3b3e21f=
ac565c
@@ -28,7 +28,6 @@ SRCREV_pn-eglibc-initial ?=3D "6229"
 SRCREV_pn-eds-dbus ?=3D "659"
 SRCREV_pn-eglibc ?=3D "6229"
 SRCREV_pn-eglibc-initial ?=3D "6229"
-SRCREV_pn-eglibc-intermediate ?=3D "6229"
 SRCREV_pn-enlazar ?=3D "37"
 SRCREV_pn-exalt ?=3D "79"
 SRCREV_pn-exalt-daemon ?=3D "78"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/include/slugos.inc	9b41afe5f573c4ce71c88ddf2bcda240c4dae42c
+++ conf/distro/include/slugos.inc	15ec40d1c8105150bd6e9f5af9d3efa15ffa623d
@@ -96,13 +96,14 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
=20
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-init=
ial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cross=
-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
=20
 #Set preferred provider for the C library that is used to build the crossc=
ompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc       =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc     =3D "glibc-interme=
diate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc       =3D "glibc"
+PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc     =3D "glibc"
=20
 # Set the preferred provider for a few toolchain-related items, otherwise
 # these may be selected from the external-toolchain instead.
@@ -118,8 +119,8 @@ PREFERRED_VERSION_gcc-cross-initial  ?=3D=20
 PREFERRED_VERSION_gcc-cross          ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk      ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial  ?=3D "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate  ?=3D "4.1.2"
 PREFERRED_VERSION_glibc              ?=3D "2.5"
-PREFERRED_VERSION_glibc-intermediate ?=3D "2.5"
 PREFERRED_VERSION_glibc-initial      ?=3D "2.5"
=20
 # Select the smallest provider of x11 libraries
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/jlime-donkey.conf	fb7ea51917dde4bafa36f1b4a43be01e96610ad6
+++ conf/distro/jlime-donkey.conf	af6cabdd09a5bd6796c790944232bdcb47f2c83b
@@ -20,10 +20,11 @@ PREFERRED_PROVIDERS +=3D  "virtual/${TARGE
 #<> We will set CVS DATE when things are known to work.
 #<>-----------------------------------------------------------------<
 PREFERRED_PROVIDERS +=3D  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D  "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D  "virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc =3D "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc"
=20
 #<>----------------------------------------------------------------->
 #<> We want this so we can crosscompile the kernel using gcc 3.4.3
@@ -51,10 +52,10 @@ PREFERRED_VERSION_gcc-cross-initial =3D "4
 PREFERRED_VERSION_gcc =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial =3D "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "4.2.2"
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.23"                         =
                    		   =20
 PREFERRED_VERSION_glibc =3D "2.6.1"
 PREFERRED_VERSION_glibc-initial =3D "2.6.1"
-PREFERRED_VERSION_glibc-intermediate =3D "2.6.1"
=20
 #<>------------------------------------------------------------------>
 #<>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/jlime-henchman.conf	40b971ca62e022ba5da642d0dd65e9472369efc=
9
+++ conf/distro/jlime-henchman.conf	576306734d9284a03e4a2c7d9af7aeab477b903=
c
@@ -50,12 +50,14 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
 PREFERRED_VERSION_gcc =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial =3D "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "4.2.2"
 PREFERRED_VERSION_binutils =3D "2.18"
 PREFERRED_VERSION_binutils-cross =3D "2.18"
=20
@@ -69,12 +71,11 @@ PREFERRED_PROVIDER_virtual/libc =3D "glibc
 PREFERRED_PROVIDER_virtual/libiconv =3D "glibc"
 PREFERRED_PROVIDER_virtual/libintl =3D "glibc"
 PREFERRED_PROVIDER_virtual/libc =3D "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc =3D "glibc-interm=
ediate"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc =3D "g=
libc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc =3D "g=
libc"
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.23"
 PREFERRED_VERSION_glibc =3D "2.5"
-PREFERRED_VERSION_glibc-intermediate =3D "2.5"
=20
 #
 # Bootstrap & Init
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/jlime-mongo.conf	239a9bf19ee598d83ee84d5958a12b71bd7bef47
+++ conf/distro/jlime-mongo.conf	326f98ce35aedb012b0e23bd6d1c4d5364d22c5b
@@ -51,12 +51,14 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
 PREFERRED_VERSION_gcc =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross =3D "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial =3D "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "4.2.2"
 PREFERRED_VERSION_binutils =3D "2.18"
 PREFERRED_VERSION_binutils-cross =3D "2.18"
=20
@@ -70,12 +72,11 @@ PREFERRED_PROVIDER_virtual/libc =3D "glibc
 PREFERRED_PROVIDER_virtual/libiconv =3D "glibc"
 PREFERRED_PROVIDER_virtual/libintl =3D "glibc"
 PREFERRED_PROVIDER_virtual/libc =3D "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc =3D "glibc-interm=
ediate"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc =3D "g=
libc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc =3D "g=
libc"
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.18"
 PREFERRED_VERSION_glibc =3D "2.5"
-PREFERRED_VERSION_glibc-intermediate =3D "2.5"
=20
 #
 # Bootstrap & Init
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/jlime-shrek.conf	4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491
+++ conf/distro/jlime-shrek.conf	4960e4997a76b212b2bda2ec3ddab16d81622075
@@ -12,6 +12,7 @@ PREFERRED_PROVIDERS  =3D  "virtual/${TARGE
 SRCDATE =3D "20050518"
=20
 PREFERRED_PROVIDERS  =3D  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS  =3D  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -24,6 +25,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "3
 PREFERRED_VERSION_gcc =3D "3.4.3"
 PREFERRED_VERSION_gcc-cross =3D "3.4.3"
 PREFERRED_VERSION_gcc-cross-initial =3D "3.4.3"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.3"
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.7.0"                        =
                     		   =20
 PREFERRED_VERSION_glib-2.0-native =3D "2.6.2"
 PREFERRED_VERSION_glib-2.0 =3D "2.6.2"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/mamona.conf	fd683d8ddd62359322234b247211b416f546a004
+++ conf/distro/mamona.conf	2259bb76e74ceface351ef6266ee9f3284c8e414
@@ -34,6 +34,7 @@ PREFERRED_PROVIDERS_virtual/${TARGET_PRE
=20
 # gcc
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-ini=
tial"
+PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cros=
s-intermediate"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
=20
@@ -41,6 +42,7 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_gcc-cross ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.2"
=20
 # binutils
 PREFERRED_VERSION_binutils ?=3D "2.18"
@@ -55,17 +57,15 @@ PREFERRED_VERSION_glibc ?=3D "2.5"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?=3D "glibc-initia=
l"
=20
 PREFERRED_VERSION_glibc ?=3D "2.5"
-PREFERRED_VERSION_glibc-intermediate_i686 ?=3D "2.4"
-PREFERRED_VERSION_glibc-intermediate ?=3D "2.5"
 PREFERRED_VERSION_glibc-initial ?=3D "2.5"
 PREFERRED_VERSION_uclibc ?=3D "0.9.29"
=20
 # NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-gnueabi-libc-for-gcc =3D "glib=
c-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-mamona-linux-gnueabi-libc-for-gcc =3D "gl=
ibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-libc-for-gcc =3D "glibc-interm=
ediate"
-PREFERRED_PROVIDER_virtual/i586-mamona-linux-libc-for-gcc =3D "glibc-inter=
mediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/arm-mamona-linux-gnueabi-libc-for-gcc =3D "glib=
c"
+PREFERRED_PROVIDER_virtual/armeb-mamona-linux-gnueabi-libc-for-gcc =3D "gl=
ibc"
+PREFERRED_PROVIDER_virtual/arm-mamona-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/i586-mamona-linux-libc-for-gcc =3D "glibc"
=20
 # Other Packages
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -82,4 +82,4 @@ PREFERRED_VERSION_gpsd ?=3D "2.33"
=20
 PREFERRED_VERSION_apt =3D "0.7.6"
 PREFERRED_VERSION_gpsd ?=3D "2.33"
-PREFERRED_VERSION_hal_nokia770 =3D "0.5.7"
\ No newline at end of file
+PREFERRED_VERSION_hal_nokia770 =3D "0.5.7"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/minimal.conf	3659ec6bf90d9eac32c48e7ac2207b2a8c100d28
+++ conf/distro/minimal.conf	bb050fd7b97576649bce4f1605b0c122f9cbea02
@@ -37,6 +37,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Binutils & Compiler
 #
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-init=
ial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cross=
-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/arm-linux-binutils =3D "binutils-cross"
@@ -45,6 +46,7 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_gcc ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.1"
 PREFERRED_VERSION_binutils ?=3D "2.18"
 PREFERRED_VERSION_binutils-cross ?=3D "2.18"
=20
@@ -61,11 +63,10 @@ PREFERRED_PROVIDER_virtual/libc =3D "glibc
 PREFERRED_PROVIDER_virtual/libiconv =3D "glibc"
 PREFERRED_PROVIDER_virtual/libintl =3D "glibc"
 PREFERRED_PROVIDER_virtual/libc =3D "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
 PREFERRED_PROVIDER_linux-libc-headers =3D "linux-libc-headers"
 PREFERRED_VERSION_linux-libc-headers ?=3D "2.6.23"
 PREFERRED_VERSION_glibc ?=3D "2.5"
-PREFERRED_VERSION_glibc-intermediate ?=3D "2.5"
=20
 #
 # Bootstrap & Init
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/nylon.conf	55b55fd58b093f18dc69ad389287e77c548403ae
+++ conf/distro/nylon.conf	93b37b27f5a8b665966cdcd8b90187ec5428f2bc
@@ -17,6 +17,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 INHERIT +=3D "linux-kernel-base"
=20
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -35,6 +36,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "3
 PREFERRED_VERSION_kismet =3D "2005-01-R1"
=20
 PREFERRED_VERSION_gcc-cross-initial =3D "3.3.4"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.3.4"
 PREFERRED_VERSION_gcc-cross =3D "3.3.4"
 PREFERRED_VERSION_gcc-cross-sdk =3D "3.3.4"=20
 PREFERRED_VERSION_gcc =3D "3.3.4"
@@ -50,6 +52,7 @@ PREFERRED_VERSION_gcc-cross-initial_mtx-
=20
 #PREFERRED_VERSION_glibc_mtx-3 =3D "2.3.5+cvs20050627"
 PREFERRED_VERSION_gcc-cross-initial_mtx-3 =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate_mtx-3 =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross_mtx-3 =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk_mtx-3 =3D "3.4.4"=20
 PREFERRED_VERSION_gcc_mtx-3 =3D "3.4.4"
@@ -71,6 +74,7 @@ PREFERRED_VERSION_gcc-cross-initial_mtx-
=20
 #PREFERRED_VERSION_glibc_mtx-3a =3D "2.3.5+cvs20050627"
 PREFERRED_VERSION_gcc-cross-initial_mtx-3a =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate_mtx-3a =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross_mtx-3a =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk_mtx-3a =3D "3.4.4"=20
 PREFERRED_VERSION_gcc_mtx-3a =3D "3.4.4"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/openprotium.conf	fa9e89af0f2d1321bd93fb2c08dfc7fa720a7d51
+++ conf/distro/openprotium.conf	982f64d7db8d48f170cd1aa284d266ddbc1030ce
@@ -45,9 +45,9 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_gcc-cross ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk ?=3D "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.2"
=20
 PREFERRED_VERSION_glibc		     =3D "2.6.1"
-PREFERRED_VERSION_glibc-intermediate =3D "2.6.1"
 PREFERRED_VERSION_glibc-initial      =3D "2.6.1"
=20
 PREFERRED_VERSION_linux-libc-headers =3D "2.6.11.1"
@@ -59,11 +59,12 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 #
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "gcc-cross-init=
ial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "gcc-cross=
-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
=20
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc =3D "glibc-intermedi=
ate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc =3D "glibc"
 PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial =3D "glibc-initial"
=20
 PREFERRED_PROVIDER_virtual/libc     =3D "glibc"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/oplinux-uclibc.conf	ded77d3149a141de656d62e5c1ed7e161f1e500=
d
+++ conf/distro/oplinux-uclibc.conf	af3019dae5fb6717311d042ac2f3114f99cdd50=
e
@@ -43,12 +43,14 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
 PREFERRED_VERSION_gcc ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.1"
 PREFERRED_VERSION_binutils ?=3D "2.17.50.0.5"
 PREFERRED_VERSION_binutils-cross ?=3D "2.17.50.0.5"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/oplinux.conf	0dbc9a811a5f426f5d3e4ead5a20330b56e51e41
+++ conf/distro/oplinux.conf	007c319d5693215e75c73b455c5c76a0f2465501
@@ -35,6 +35,7 @@ PREFERRED_PROVIDERS +=3D "virtual/${TARGET
 TARGET_OS =3D "linux"
=20
 PREFERRED_PROVIDERS +=3D "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-in=
itial"
+PREFERRED_PROVIDERS +=3D "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cro=
ss-intermediate"
 PREFERRED_PROVIDERS +=3D "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D "virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
@@ -51,14 +52,14 @@ PREFERRED_PROVIDER_virtual/libc ?=3D "glib
 PREFERRED_PROVIDER_virtual/libc ?=3D "glibc"
=20
=20
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc-interme=
diate"
-PREFERRED_PROVIDER_virtual/arm-oplinux-linux-gnueabi-libc-for-gcc =3D "gli=
bc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-oplinux-linux-gnueabi-libc-for-gcc =3D "g=
libc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc =3D "glibc-intermediat=
e"
-PREFERRED_PROVIDER_virtual/powerpc-oplinux-linux-libc-for-gcc =3D "glibc-i=
ntermediate"
-PREFERRED_PROVIDER_virtual/mipsel-oplinux-linux-libc-for-gcc =3D "glibc-in=
termediate"
-PREFERRED_PROVIDER_virtual/sparc-oplinux-linux-libc-for-gcc =3D "glibc-int=
ermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/arm-oplinux-linux-gnueabi-libc-for-gcc =3D "gli=
bc"
+PREFERRED_PROVIDER_virtual/armeb-oplinux-linux-gnueabi-libc-for-gcc =3D "g=
libc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-oplinux-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/mipsel-oplinux-linux-libc-for-gcc =3D "glibc"
+PREFERRED_PROVIDER_virtual/sparc-oplinux-linux-libc-for-gcc =3D "glibc"
=20
=20
=20
@@ -84,6 +85,7 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_gcc-cross ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk ?=3D "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "4.1.1"
=20
 PREFERRED_VERSION_binutils ?=3D "2.17.50.0.5"
 PREFERRED_VERSION_binutils-cross ?=3D "2.17.50.0.5"
@@ -96,7 +98,6 @@ PREFERRED_VERSION_glibc-initial ?=3D "2.5"
 PREFERRED_VERSION_linux-libc-headers ?=3D "2.6.18"
=20
 PREFERRED_VERSION_glibc-initial ?=3D "2.5"
-PREFERRED_VERSION_glibc-intermediate ?=3D "2.5"
 PREFERRED_VERSION_glibc ?=3D "2.5"
=20
 PCMCIA_MANAGER =3D "pcmciautils"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/sharprom-compatible.conf	866d17894061cd031cda619513332fa012=
433fa3
+++ conf/distro/sharprom-compatible.conf	89b78178c717a75e6dc950636c6903fbfb=
6fb989
@@ -41,6 +41,7 @@ PREFERRED_PROVIDER_virtual/arm-linux-gcc
 PREFERRED_PROVIDER_virtual/arm-linux-gcc =3D "sharprom-toolchain-native"=
=20
 PREFERRED_PROVIDER_linux-libc-headers =3D "linux-libc-headers"
 PREFERRED_PROVIDER_virtual/arm-linux-gcc-initial =3D "sharprom-toolchain-n=
ative"
+PREFERRED_PROVIDER_virtual/arm-linux-gcc-intermediate =3D "sharprom-toolch=
ain-native"
=20
 PREFERRED_VERSION_glibc =3D "2.2.5"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/ucslugc.conf	13de2c9a77700ae97b0f7a3dbb79971cb6451ca6
+++ conf/distro/ucslugc.conf	bb32cc5c8cbf8d2446f2bf2eef140a2ccd04ee1d
@@ -10,6 +10,7 @@ PREFERRED_VERSION_gcc-cross-initial =3D "3
 TARGET_OS =3D "linux-uclibc"
=20
 PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross =3D "3.4.4"
 PREFERRED_VERSION_gcc =3D "3.4.4"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/unslung.conf	0ef6d906a67568b77e1f68fc1ac5c65f65586c67
+++ conf/distro/unslung.conf	a7d66feda58ef5de37cbaf33395cb0dd4e1e7586
@@ -42,6 +42,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
=20
 # Select between multiple alternative providers, if more than one is eligi=
ble.
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -54,6 +55,7 @@ PREFERRED_VERSION_gcc-cross-initial ?=3D "
 PREFERRED_VERSION_binutils ?=3D "2.15.94.0.1"
 PREFERRED_VERSION_binutils-cross ?=3D "2.15.94.0.1"
 PREFERRED_VERSION_gcc-cross-initial ?=3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate ?=3D "3.4.4"
 PREFERRED_VERSION_gcc-cross ?=3D "3.4.4"
 PREFERRED_VERSION_gcc ?=3D "3.4.4"
 PREFERRED_VERSION_glibc ?=3D "2.2.5"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/distro/wrt54oe.conf	9d556281a94a6474ec9b7e6edffabcecd876b083
+++ conf/distro/wrt54oe.conf	511263e0f8d97edcbcab96283a7c703b27f7072b
@@ -14,11 +14,13 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 TARGET_OS =3D "linux-uclibc"
=20
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
=20
 PREFERRED_VERSION_gcc-cross-initial =3D "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross =3D "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk =3D "3.4.4"=20
 PREFERRED_VERSION_gcc =3D "3.4.4"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/local.conf.sample	fa7f5ad0f812c943367b2c88b4e4f7165797959d
+++ conf/local.conf.sample	5164ed855456a3c58975fcfbad1c9da8dd8d60f2
@@ -51,6 +51,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGE
 PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
 PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
+PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cr=
oss-intermediate"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/machine/native.conf	9f73a28ea65b27265df3e4afa2107401f9463ead
+++ conf/machine/native.conf	e4b8c17ba26581950b67bf9e306d9f1664c0741f
@@ -7,7 +7,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "nat
 VENDOR =3D "-oe"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "native-kernel"
-ASSUME_PROVIDED +=3D "virtual/gcc-initial virtual/gcc virtual/g++ virtual/=
libc virtual/libintl virtual/libiconv"
+ASSUME_PROVIDED +=3D "virtual/gcc-initial virtual/gcc-intermediate virtual=
/gcc virtual/g++"
 ASSUME_PROVIDED +=3D "binutils-cross"
 ASSUME_PROVIDED +=3D "virtual/libiconv virtual/libintl virtual/libc"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/eglibc/eglibc-initial.inc	9cc9a816e903fd588bfe9b6529f690d24297=
a54b
+++ packages/eglibc/eglibc-initial.inc	4b2b73384f3c8f940e42387057da88a76435=
f44c
@@ -1,5 +1,5 @@ SECTION =3D "libs"
 SECTION =3D "libs"
-DEPENDS =3D "linux-libc-headers"
+DEPENDS =3D "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc', '${FILE_D=
IRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
@@ -9,11 +9,13 @@ do_configure () {
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
-	CC=3D"${BUILD_CC}" CPP=3D"${BUILD_CPP}" LD=3D"${BUILD_LD}" \
+        (cd ${S} && gnu-configize) || die "failure in running gnu-configiz=
e"
+        find ${S} -name "configure" | xargs touch
 	${S}/configure --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
+		--prefix=3D/usr \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=3D${STAGING_DIR_TARGET}${layout_includedir} \
-		--enable-hacker-mode
+		--enable-hacker-mode --enable-addons
 }
=20
 do_compile () {
@@ -22,8 +24,14 @@ do_stage () {
=20
 do_stage () {
 	oe_runmake cross-compiling=3Dyes install_root=3D${STAGING_DIR_HOST} \
-	includedir=3D'${layout_includedir}' prefix=3D'${layout_prefix}' install-h=
eaders
+	includedir=3D'${layout_includedir}' prefix=3D'${layout_prefix}' install-h=
eaders \
+	install-bootstrap-headers=3Dyes
+        oe_runmake csu/subdir_lib
=20
+        mkdir -p ${STAGING_DIR_TARGET}${layout_libdir}
+        install -m 644 csu/crt[1in].o ${STAGING_DIR_TARGET}${layout_libdir=
}
+        ${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+                       -o ${STAGING_DIR_TARGET}${layout_libdir}/libc.so
 }
=20
 do_install () {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/eglibc/eglibc.inc	20ecb0b8894a6fa79214db154c8cd4e8458d7237
+++ packages/eglibc/eglibc.inc	eef22ba34145bef9522d66a4eb30da587ba3e6a2
@@ -4,12 +4,12 @@ LICENSE =3D "LGPL"
 PRIORITY =3D "required"
 LICENSE =3D "LGPL"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS =3D "${@['virtual/${TARGET_PREFIX}gcc-initial', 'virtual/${TARGET_=
PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} linux-libc-headers"
+DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd +=3D " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-RDEPENDS +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES =3D "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', '']=
['nptl' in '${GLIBC_ADDONS}']}"
+#RDEPENDS +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
+PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES +=3D "virtual/libintl virtual/libiconv"
=20
 inherit autotools
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-3.4.4.inc	b6121dbf8fda33791722c94759192ce86145319f
+++ packages/gcc/gcc-3.4.4.inc	db48eb2b8c53c3d57d561258a42cace119a70438
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/g
 	   file://always-fixincperm.patch;patch=3D1 \
 	   file://GCOV_PREFIX_STRIP-cross-profile_3.4.patch;patch=3D1 \
 	   file://zecke-xgcc-cpp.patch;patch=3D1 \
+	   file://gcc-libgcc2-inhibit-libc.patch;patch=3D1 \
 	   file://gcc4-mtune-compat.patch;patch=3D1"
=20
 SRC_URI +=3D "file://gcc34-configure.in.patch;patch=3D1"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-4.3.1.inc	c95319fe788a145ce0a5aecd6d6c270424e47e03
+++ packages/gcc/gcc-4.3.1.inc	7ee3a1d24f6fe58cc59653a6e65c7e8bcc68a8a7
@@ -45,7 +45,6 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc
 	file://904-flatten-switch-stmt-00.patch;patch=3D1 \
 	file://arm-nolibfloat.patch;patch=3D1 \
 	file://arm-softfloat.patch;patch=3D1 \
-#	file://gcc41-configure.in.patch;patch=3D1 \
 #	file://arm-thumb.patch;patch=3D1 \
 #	file://arm-thumb-cache.patch;patch=3D1 \
 	file://ldflags.patch;patch=3D1 \
@@ -59,6 +58,8 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc
 #	file://intermask-bigendian.patch;patch=3D1 \
 	file://gcc-arm-frename-registers.patch;patch=3D1 \
 	file://gcc-release-branch/PR-36500-fix-neon.patch;patch=3D1 \
+	file://gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch;patch=3D1 \
+	file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch;patch=3D1 \
 "
=20
 SRC_URI_append_sh3  =3D " file://sh3-installfix-fixheaders.patch;patch=3D1=
 "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-configure-cross.inc	703d1979546f41f4a81d5aed72bf335e2b=
c5c69e
+++ packages/gcc/gcc-configure-cross.inc	4882906171abcb3738dfefb319ad714053=
c3adbe
@@ -7,10 +7,6 @@ EXTRA_OECONF_PATHS =3D "--with-local-prefi
                       --with-sysroot=3D${STAGING_DIR_TARGET} \
                       --with-build-sysroot=3D${STAGING_DIR_TARGET}"
=20
-do_configure_prepend () {
-	rm -f ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/libgcc_eh.a
-}
-
 do_compile_prepend () {
 	export CC=3D"${BUILD_CC}"
 	export AR_FOR_TARGET=3D"${TARGET_SYS}-ar"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-initial.inc	ad4596bca70fbc850a629b1582fafb6479bc=
b65d
+++ packages/gcc/gcc-cross-initial.inc	6dc1ca2688a86e10d96b345c271514ca7e6b=
0f1e
@@ -1,6 +1,4 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binut
 DEPENDS =3D "virtual/${TARGET_PREFIX}binutils"
-# @todo Please add comment on why this is (still?) needed?
-DEPENDS +=3D "${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVa=
r('TARGET_ARCH', d, 1) in ['arm', 'armeb', 'mips', 'mipsel', 'powerpc']]}"
 PROVIDES =3D "virtual/${TARGET_PREFIX}gcc-initial"
 PACKAGES =3D ""
=20
@@ -8,6 +6,7 @@ EXTRA_OECONF =3D "--with-local-prefix=3D${ST
 # sysroot is needed in case we use libc-initial
 EXTRA_OECONF =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${layout_pref=
ix} \
 		--with-newlib \
+		--without-headers \
 		--disable-shared \
 		--disable-threads \
 		--disable-multilib \
@@ -19,11 +18,6 @@ EXTRA_OECONF =3D "--with-local-prefix=3D${ST
 		--with-build-sysroot=3D${STAGING_DIR_TARGET} \
 		${@get_gcc_fpu_setting(bb, d)}"
=20
-do_stage_prepend () {
-	mkdir -p ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}
-	ln -sf libgcc.a ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/libgcc_eh.a
-}
-
 do_install () {
 	:
 }
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gcc/gcc-cross-initial_4.3.1.bb	4b22e8ec5d3911ce0553e074354f5ad=
218d7fce8
+++ packages/gcc/gcc-cross-initial_4.3.1.bb	1aadd72b822c32000450e9ae18facee=
f0112a99a
@@ -5,6 +5,7 @@ EXTRA_OECONF +=3D " --disable-libmudflap \
=20
 EXTRA_OECONF +=3D " --disable-libmudflap \
 		  --disable-libgomp \
+		  --enable-decimal-float=3Dno \
 		  --disable-libssp"
=20
 # Hack till we fix *libc properly
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-initial.inc	0480105971d23c66b379db96774c07f2a09139=
89
+++ packages/glibc/glibc-initial.inc	7a1a79ecca0658f29a905c2140d27445a57bad=
55
@@ -1,5 +1,5 @@ SECTION =3D "libs"
 SECTION =3D "libs"
-DEPENDS =3D "linux-libc-headers"
+DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FIL=
E_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
@@ -9,7 +9,8 @@ do_configure () {
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
-	CC=3D"${BUILD_CC}" CPP=3D"${BUILD_CPP}" LD=3D"${BUILD_LD}" ${S}/configure=
 --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
+	find ${S} -name "configure" | xargs touch
+	${S}/configure --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=3D${STAGING_DIR_TARGET}${layout_includedir} \
 		--enable-hacker-mode
@@ -30,8 +31,11 @@ do_stage () {
 }
=20
 do_stage () {
-	oe_runmake cross-compiling=3Dyes install_root=3D${STAGING_DIR_HOST} inclu=
dedir=3D'${layout_includedir}' prefix=3D'${layout_prefix}' install-headers
+	oe_runmake cross-compiling=3Dyes install_root=3D${STAGING_DIR_HOST} \
+	includedir=3D'${layout_includedir}' prefix=3D'${layout_prefix}' \
+	install-bootstrap-headers=3Dyes install-headers
=20
+	oe_runmake csu/subdir_lib
 	# Two headers -- stubs.h and features.h -- aren't installed by install-he=
aders,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
@@ -42,6 +46,10 @@ do_stage () {
 	if [ -e ${B}/bits/stdio_lim.h ]; then
 		cp ${B}/bits/stdio_lim.h  ${STAGING_INCDIR}/bits/
 	fi
+	mkdir -p ${STAGING_DIR_TARGET}${layout_libdir}
+	install -m 644 csu/crt[1in].o ${STAGING_DIR_TARGET}${layout_libdir}
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${STAGING_DIR_TARGET}${layout_libdir}/libc.so
 }
=20
 do_install () {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-initial_2.5.bb	c87dce64dc313f734e0764420892401b0c7=
301ee
+++ packages/glibc/glibc-initial_2.5.bb	717f9cbf298c7866010b883caec46b01814=
a1ca4
@@ -5,7 +5,7 @@ do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
 	unset CFLAGS
-	CC=3D"${BUILD_CC}" CPP=3D"${BUILD_CPP}" LD=3D"${BUILD_LD}" ${S}/configure=
 --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
+	${S}/configure --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=3D${STAGING_INCDIR} \
 		--enable-hacker-mode
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-stage.inc	8abe1d7d9fd4c34d725a7f26db2110bb66ec3e16
+++ packages/glibc/glibc-stage.inc	9add53332fea43aff1a7efdeba79858facecfc1a
@@ -3,7 +3,7 @@ do_stage() {
 	oe_runmake 'install_root=3D${STAGING_DIR_HOST}' \
 		   'includedir=3D${layout_includedir}' 'libdir=3D${layout_libdir}' 'slib=
dir=3D${layout_base_libdir}' \
 		   '${STAGING_DIR_HOST}${layout_base_libdir}/libc.so.6' \
-		   install-headers install-lib
+		   install
=20
 	install -d ${STAGING_INCDIR}/gnu \
 		   ${STAGING_INCDIR}/bits \
@@ -15,9 +15,4 @@ do_stage() {
 		h=3D`echo $r|sed -e's,\.x$,.h,'`
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
 	done
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${STAGING_DIR_HOST}/${layout_libdir}/ || die "fa=
iled to install $i"
-	done
-	echo 'GROUP ( ${layout_base_libdir}/libpthread.so.0 ${layout_libdir}/libp=
thread_nonshared.a )' > ${STAGING_DIR_HOST}/${layout_libdir}/libpthread.so
-	echo 'GROUP ( ${layout_base_libdir}/libc.so.6 ${layout_libdir}/libc_nonsh=
ared.a )' > ${STAGING_DIR_HOST}/${layout_libdir}/libc.so
 }
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc.inc	94a32473f1193137d45da97d6ed786ae9e755094
+++ packages/glibc/glibc.inc	d7da3e08d193524257645bad4468dbb3dd7ed044
@@ -4,12 +4,12 @@ LICENSE =3D "LGPL"
 PRIORITY =3D "required"
 LICENSE =3D "LGPL"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS =3D "${@['virtual/${TARGET_PREFIX}gcc-initial', 'virtual/${TARGET_=
PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} linux-libc-headers"
+DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd +=3D " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-RDEPENDS +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES =3D "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', '']=
['nptl' in '${GLIBC_ADDONS}']}"
+#RDEPENDS +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
+PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES +=3D "virtual/libintl virtual/libiconv"
=20
 inherit autotools
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc_2.3.6.bb	a180c138b01077df8b234264ee6abd46cbf72314
+++ packages/glibc/glibc_2.3.6.bb	7ce57da5312cee1deb44c097867123d097f84146
@@ -19,13 +19,16 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gli
            ${CROSSTOOL_PATCH_URL}glibc-2.3.6-fix-pr631.patch;patch=3D1 \
            ${CROSSTOOL_PATCH_URL}glibc-fp-byteorder.patch;patch=3D1 \
            ${CROSSTOOL_PATCH_URL}glibc-mips-bootstrap-gcc-header-install.p=
atch;patch=3D1 \
+           ${CROSSTOOL_PATCH_URL}arm-ctl_bus_isa.patch;patch=3D1 \
            ${CROSSTOOL_PATCH_URL}make-install-lib-all.patch;patch=3D1 \
            ${CROSSTOOL_PATCH_URL}maybe/glibc-2.3.6-allow-gcc-4.0-powerpc32=
.patch;patch=3D1 \
            file://glibc-2.3.6-bind-already-defined-on-powerpc.patch;patch=
=3D1 \
            file://glibc-2.3.6-allow-gcc-4.1-powerpc32-initfini.s.patch;pat=
ch=3D1 \
            file://glibc-2.3.6-linuxthreads-allow-gcc-4.1-powerpc32-initfin=
i.s.patch;patch=3D1 \
-           file://late-install-loop-break.patch \
-	   \
+           file://late-install-loop-break.patch;patch=3D1 \
+           file://glibc-arm-socket-weakalias.patch;patch=3D1 \
+           file://glibc-2.3.6-linuxthreads-pthread-raise.patch;patch=3D1 \
+           file://glibc-cross_sunrpc.patch;patch=3D1 \
            file://etc/ld.so.conf \
 	   file://generate-supported.mk"
=20
@@ -60,7 +63,7 @@ do_configure () {
 		exit 1
 	fi
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
-	CPPFLAGS=3D"" oe_runconf
+	CPPFLAGS=3D"" libc_cv_forced_unwind=3Dyes libc_cv_c_cleanup=3Dyes oe_runc=
onf
 }
=20
 rpcsvc =3D "bootparam_prot.x nlm_prot.x rstat.x \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc_2.5.bb	3c1686afff4b72f25b0ee4879fa7df5bed91c6b3
+++ packages/glibc/glibc_2.5.bb	330520507426ad66fcbf5a266a8aa5845504a744
@@ -48,6 +48,7 @@ SRC_URI =3D "\
   file://glibc-check_pf.patch;patch=3D1;pnum=3D0 \
   file://zecke-sane-readelf.patch;patch=3D1 \
   file://ldd-unbash.patch;patch=3D1 \
+  file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=3D1 \
   file://generic-bits_select.h \
   file://generic-bits_types.h \
   file://generic-bits_typesizes.h \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc_2.6.1.bb	8b5e0d298c84d71b8a15be26527883a393e5483d
+++ packages/glibc/glibc_2.6.1.bb	17745de42ba1ebc4c1d4242154c294e27aa5a73c
@@ -56,6 +56,7 @@ SRC_URI =3D "\
   file://etc/ld.so.conf \
   file://generate-supported.mk \
   file://glibc-2.6.1-RTLD_SINGLE_THREAD_P-1.patch;patch=3D1 \
+  file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=3D1 \
 "
=20
 # Build fails on sh3 and sh4 without additional patches
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc_2.7.bb	02c169c2754286db4f842bbe42a680e438defb73
+++ packages/glibc/glibc_2.7.bb	73c2cf870a5fd5c6da7625ada47fefdf0948c1be
@@ -12,7 +12,7 @@ TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGE
 TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${layout_includedir}"
=20
=20
-FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-2.4"
+FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FIL=
E_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
 GLIBC_ADDONS ?=3D "ports,nptl,libidn"
=20
@@ -58,6 +58,8 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gli
 #	   file://zecke-sane-readelf.patch;patch=3D1 \
            file://ldd-unbash.patch;patch=3D1 \
 	   file://glibc-arm-IO-acquire-lock-fix.diff;patch=3D1 \
+	   file://all_glibc-i586-chk.patch;patch=3D1 \
+	   file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=3D1 \
 	   file://generic-bits_select.h \
 	   file://generic-bits_types.h \
 	   file://generic-bits_typesizes.h \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/meta/external-toolchain.bb	ebcd8679c393d51824573b5a70c7a071f85=
21117
+++ packages/meta/external-toolchain.bb	fe769763ba169fd561e2c5f1153726281af=
a9952
@@ -6,6 +6,7 @@ PROVIDES =3D "\
     linux-libc-headers \
     virtual/${TARGET_PREFIX}gcc \
     virtual/${TARGET_PREFIX}gcc-initial \
+    virtual/${TARGET_PREFIX}gcc-intermediate \
     virtual/${TARGET_PREFIX}binutils \
     virtual/${TARGET_PREFIX}libc-for-gcc \
     virtual/libc \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb	63c582236d=
5e631780a864456ba4db4862602a0e
+++ packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb	8e92e1882c=
b3bc63515abe5cc42b6577706e118d
@@ -12,6 +12,7 @@ PROVIDES_sharprom-compatible =3D "\
   virtual/libiconv \
   virtual/arm-linux-gcc \
   virtual/arm-linux-libc-for-gcc \
+  virtual/arm-linux-gcc-intermediate \
   virtual/arm-linux-gcc-initial "
 PR =3D "r2"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-initial_0.9.26.bb	4add23305e16ae6d0973c44aae89b3=
f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.26.bb	a184826f227450c3799472708b38d9=
5c759f1457
@@ -3,20 +3,26 @@ FILESPATH =3D "${@base_set_filespath([ '${
=20
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${=
FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
-DEPENDS =3D "linux-libc-headers"
+DEPENDS =3D "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES =3D ""
=20
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
=20
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
=20
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
 }
=20
 do_install() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-initial_0.9.27.bb	4add23305e16ae6d0973c44aae89b3=
f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.27.bb	bf5a03c0a95f607474c7585a1cdaec=
562bbb1747
@@ -3,20 +3,27 @@ FILESPATH =3D "${@base_set_filespath([ '${
=20
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${=
FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
-DEPENDS =3D "linux-libc-headers"
+DEPENDS =3D "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES =3D ""
=20
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
=20
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
=20
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
=20
 do_install() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-initial_0.9.28.bb	4add23305e16ae6d0973c44aae89b3=
f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.28.bb	bf5a03c0a95f607474c7585a1cdaec=
562bbb1747
@@ -3,20 +3,27 @@ FILESPATH =3D "${@base_set_filespath([ '${
=20
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${=
FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
-DEPENDS =3D "linux-libc-headers"
+DEPENDS =3D "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES =3D ""
=20
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=3D${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
=20
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
=20
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
=20
 do_install() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-initial_0.9.29.bb	d9cf01fb4dec69ff1f796d39c90780=
30982eacca
+++ packages/uclibc/uclibc-initial_0.9.29.bb	af0ccde83d59f1948f1f2b5f7d4952=
d4855c58bc
@@ -3,7 +3,7 @@ FILESPATH =3D "${@base_set_filespath([ '${
=20
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${=
FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
-DEPENDS =3D "linux-libc-headers ncurses-native"
+DEPENDS =3D "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc=
-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES =3D ""
=20
@@ -11,13 +11,20 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
 		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
=20
 	install -d ${CROSS_DIR}/${TARGET_SYS}=09
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
=20
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
=20
 do_install() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-initial_svn.bb	2715cc791b3fdd1b8e62328291e3ef339=
73bacc0
+++ packages/uclibc/uclibc-initial_svn.bb	766c264be7d787f2285f02b13a392f43c=
b2a87d2
@@ -3,7 +3,7 @@ FILESPATH =3D "${@base_set_filespath([ '${
=20
 FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-cvs', '${FI=
LE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
=20
-DEPENDS =3D "linux-libc-headers ncurses-native"
+DEPENDS =3D "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc=
-initial"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES =3D ""
=20
@@ -11,12 +11,18 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
 		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX=3D DEVEL_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=3D${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
=20
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
=20
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
 }
=20
 do_install() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc.inc	48b0ba2e4cff05071b3b812ef0be0861870cd00c
+++ packages/uclibc/uclibc.inc	4f97a9d058115dbb12ae1c5d047fb84965500a51
@@ -22,7 +22,7 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binut
 PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES +=3D "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1)=
 !=3D 'yes']}"
 DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers ncurses-native"
+	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-na=
tive"
 RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
=20
 # Blackfin needs a wrapper around ld

--Boundary-00=_LnShIeLF6cxoDw/--
