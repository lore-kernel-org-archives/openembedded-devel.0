Return-Path: <list@xenhideout.nl>
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8308B601F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 12:40:10 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id CF6B85C08D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 14:40:10 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 02 May 2017 14:40:10 +0200
From: Xen <list@xenhideout.nl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <2a03627aa6ef860a55161cb321f99baf@xenhideout.nl>
References: <8abc320ccb1265aac68072693427f8eb@xenhideout.nl>
	<60efb2f4be96b3eba98acf834cb98556@xenhideout.nl>
	<2a03627aa6ef860a55161cb321f99baf@xenhideout.nl>
Message-ID: <c98a6a5d51835e36ac3e65dc2e523fb7@xenhideout.nl>
X-Sender: list@xenhideout.nl
User-Agent: Roundcube Webmail/1.2.4
Subject: Re: cacao-native 1.6.1 failing because compiler not produced?
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
X-List-Received-Date: Tue, 02 May 2017 12:40:10 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

So my apologies for these messages I guess, but yeah.

After linking a java executable Cacao-1.6.1 would build.

After specifying GCCVERSION ?= "5.4.0" openjdk-7 would build.

My little NAS device for which it was meant is too old though for the 
versions used. I have a toolchain for it but I wouldn't know how to 
inject it into OE yet.

Without chroot it segfaults and with chroot it says kernel too old.

I used "classpath-minimal" but apparently it also built AWT components.

I tried to select cacao as RPROVIDER for java2-runtime but it still 
compiled the zero hotspot. Then it needed a newer stdc++ and then it 
needed a newer libc, and then it segfaulted.

Cacao was also compiled but obviously not as libjvm.so

Thus, eventual success for compilation, but I will have to use my own 
toolchain if I want this to work.

I guess it is not required to use OE if I do not use IcedTea as you can 
apparently cross compile openjdk without OE 
(http://mail.openjdk.java.net/pipermail/zero-dev/2014-December/000538.html).

I will check with openjdk.java.net for further inquiries.

Thank you.

