Received: from mail-ie0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tgv3j-0001tl-Eg
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 11:21:37 +0100
Received: by mail-ie0-f179.google.com with SMTP id k14so631425iea.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=vascTqisuE4kIbIs/dbrTxufChniLdCHEDqv8gPIcQ0=;
	b=CBDqM9s+8yDasJ89GfubpxQTVdcSSDa4kyL+QnDnzUwoqRMA7H1rUpMobaoRs9hy4X
	tOwgtfmvtZkqpqTwub0dfXRl4H2/WTtPnNHgkhjl9NPPPzdngeM2ZCpyTC/OCIaOU5mU
	HavpU77l4PE4OJsbWhPuL7x3P/z6/ZITmUDHl3UktvoxIk6oFB6/OFQd2F3xZKlpIS7B
	scvb6O5ZW+RhDmaSJpkfPAPaj4jSdAEcFcfDbXRKPw9ZeSzxc/g7cXOf+LecYO5SzsVU
	q8ofvjpNwiu/F5swJgWP46fVMgDfwU/CEjvQb6ELREq/zKLtuGUcQCP7Amft6OroJrZO
	Xqdw==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr4547069igb.45.1354874824452;
	Fri, 07 Dec 2012 02:07:04 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 7 Dec 2012 02:07:04 -0800 (PST)
Date: Fri, 7 Dec 2012 11:07:04 +0100
Message-ID: <CALbNGRQLooCy6mSDfKW0Xt4wbXo0uja2FEovZSqVM_U8t_n7LA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org, 
	openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][meta-systemd]: ${sysconfdir}/tmpfiles.d/var-run.conf conflict at do_rootfs
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
X-List-Received-Date: Fri, 07 Dec 2012 10:21:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

with the latest layers do_rootfs fails with:

|  * check_data_file_clashes: Package systemd wants to install file
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/etc/tmpfiles.d/var-run.conf
| 	But that file is already provided by package  * base-files

var-run.conf is installed by
* systemd
* angstrom base-files.bbappend

There are two possible ways to fix:
1. Create base-files.bbappend in meta-systemd which removes var-run.conf
2. removing do_install_append in meta-angstrom / base-files.bbappend

What is the preferred solution?

Andreas


