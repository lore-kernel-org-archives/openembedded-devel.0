Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id C0FA565E12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 11:42:51 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id eb12so10662520oac.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TbKdgq5affYGAoh32SOVDq+NpZEbJHU/FQohpe9wLNM=;
	b=weLHqgwpfncw9GnGMS8VTEXU9Y14qzjlH4egk3kWmdI3MGYcu21azGYBCzsa9CtIQ5
	lGhKnt0v+EeotZzxIYiSuYbMK7NieZ1W7TrD4m+pBfOpbtDixAncQNwzWU+mQ1bwxCRh
	P2vZcD9JnDejEls5cLepSnRrbVvl/mWpqa8uSrq/LnluMMz93NCfgNqJr4x3XpGDTc0A
	I62T6pzDLR934YAR1zjfQ9+rSIJUW/MxthmXbeHgAo1YLlGXeWOKLh4Nm89qGEyc/mcg
	2cMNeKWiCBypYdNSapqqJo/usMpvGOyhPsSgl7oTOfkMGfKf1gmwBK3AV1Fk33SCyBul
	/vsg==
MIME-Version: 1.0
X-Received: by 10.182.205.135 with SMTP id lg7mr1117538obc.32.1397562171748;
	Tue, 15 Apr 2014 04:42:51 -0700 (PDT)
Received: by 10.182.204.67 with HTTP; Tue, 15 Apr 2014 04:42:51 -0700 (PDT)
Date: Tue, 15 Apr 2014 20:42:51 +0900
Message-ID: <CALYKT1ifSP62Tduyb3mvg-1C0_DqZJfYxKq0poZHZgwYthL_yQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Where can I get a arm cross toolchain for oe-core?
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
X-List-Received-Date: Tue, 15 Apr 2014 11:42:51 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I use OE for qualcomm's MDM + AP soc system.
OE is used on AP side.

The build environment is bitbake based and I felt it like a sandbox system.
I am sorry I don't know about OE, bitbake very well.. almost I know
nothing..

I can build the target image. Yes.
But I wonder how I compile any 3rd party applications for my target.
I did build one by adding the application source code into the whole image
source tree.
This way builds the application as a part of the target image. I can find
it in /usr/bin with other default applications together.

And I did build another by using a general arm cross toolchain like
arm-none-linux-gnueabi-gcc.
Using this toolchain is simple and easy. But there is no gurantee that this
toolchain has identical libc that is used in the target image. It's not
only the libc, runtime library, and hardware floating point operation
configurations are not certain, not guranteed.

I believe there should exist one that 100% syncs with OE bitbake compile
environment.
I doubt if I can try to use just OE bitbake environment for those 3rd party
applications.

How am I supposed to go forward?

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

