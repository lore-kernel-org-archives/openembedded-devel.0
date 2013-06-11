Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 325FD6AA00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:11:04 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B5184D231D; Tue, 11 Jun 2013 11:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5E6E3D22F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 11:10:46 +0200 (CEST)
Message-ID: <51B6E990.3030605@juszkiewicz.com.pl>
Date: Tue, 11 Jun 2013 11:10:40 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130529 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
	<CAMKF1soSa-S9kUC1PH9pJYbnJsvRiubNxbgNvYEx8zs4XiwmLw@mail.gmail.com>
	<51B6D7DA.1060609@juszkiewicz.com.pl>
	<CAMKF1sokFKxLAWEmSOMN15UODnWswpKRZbs79X=ggWvUW2Yepg@mail.gmail.com>
	<51B6E5AF.4080808@juszkiewicz.com.pl>
	<B614F44C-717C-420C-B6C3-69CA11A87E28@gmail.com>
In-Reply-To: <B614F44C-717C-420C-B6C3-69CA11A87E28@gmail.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
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
X-List-Received-Date: Tue, 11 Jun 2013 09:11:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 11.06.2013 11:07, Khem Raj pisze:
> 
> On Jun 11, 2013, at 1:54 AM, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
> 
>>> in this case arch does not map to what OE's target arch is so you have
>>> to do it twice if you want to use COMPATIBLE_HOST
>>
>> It has 7 OE architectures: i.86, x86_64, arm, mips(el), powerpc(64)
>> which are then mapped into 5 llvm ones. Can be gathered into one
>> COMPATIBLE_HOST (copied from kexec-tools):
>>
>> COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux)'
>>
>> "mips.*" probably needs to be changed to "mips(el)?" to not cover mips64.
> 
> and how will you fold it into -DLLVM_TARGETS_TO_BUILD=<arch>
> 
> where arch is not same as OE's target arch so you need the mapping function
> anyway was my point.

+def get_llvm_arch(d):
+    import bb;
+
+    arch = bb.data.getVar('TARGET_ARCH', d, 1)
+
+    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch ==
"i686":
+        arch = "x86"
+    elif arch == "x86_64":
+        arch = "x86_64"
+    elif arch == "arm":
+        arch = "arm"
+    elif arch == "mipsel" or arch == "mips":
+        arch = "mips"
+    elif arch == "powerpc" or arch == "powerpc64":
+        arch = "powerpc"
+
+    return arch

And done. If you try to build recipe secured by COMPATIBLE_HOST for not
compatible architecture then you have to deal with effects.

