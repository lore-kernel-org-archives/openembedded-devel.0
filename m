Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ttkrpink@gmail.com>) id 1O1eyv-0006OX-Q8
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 14:12:42 +0200
Received: by gwaa20 with SMTP id a20so907603gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=sGeNQSLzg071Gs7YkUIv9+UMDirkrKgXb3Cyj0f7IyE=;
	b=H+lWQ/6LRw4tbfGUSu+vyILVU46q+ZWak0qvnZOt48EZPASXfc9n6Eokwi6zPtph/Q
	wiDnNCWQZNUmWSYOG7YkT2PoyMgE2XH6tP+lzHo7HHPnVCBateJVs1ZDnNoZquJL64Gp
	cCDTmwZ9rLhdkTYYENcaOOt7Mbk2u2p49TgBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UYjYEp0uAGb68qAWL3VcTzpV3QnGj2DB+9Cp1cOxP5IqBaTN+jp4NDWeMac5ej1al8
	G+QZfLRd6nR3IR/U1T5EYWnO9VmxbQy0TiiRIZgJhG9WOKZkmWcqIk+BXnhnGdXpGjqA
	QhPvBBE0nVQh04V4p8UqJujTZ3SMeeTpLAsCU=
MIME-Version: 1.0
Received: by 10.100.152.3 with HTTP; Tue, 13 Apr 2010 05:09:13 -0700 (PDT)
In-Reply-To: <201004130929.43327.roman@khimov.ru>
References: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
	<201004130929.43327.roman@khimov.ru>
Date: Tue, 13 Apr 2010 07:09:13 -0500
Received: by 10.101.134.30 with SMTP id l30mr9559903ann.116.1271160554058; 
	Tue, 13 Apr 2010 05:09:14 -0700 (PDT)
Message-ID: <g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
From: ttk rpink <ttkrpink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: ttkrpink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 12:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Roman,

Great. It worked. Thanks a lot.

There is another error shows up now. Opkg-cl needs another argument after
"install". Error message listed below. Please let me know if not related and
I need open another post.

| + xargs opkg-cl -f /home/setup/stuff/tmp/staging/i686-linux/etc/opkg.conf
-o /home/setup/stuff/tmp/rootfs/beagleboard-demo-image -t
/home/setup/stuff/tmp/rootfs/beagleboard-demo-image-tmp -nodeps install
| opkg-cl: the ``install'' command requires at least one argument
| usage: opkg [options...] sub-command [arguments...]
| where sub-command is one of:
|
| Package Manipulation:
|     update            Update list of available packages
|     upgrade            Upgrade installed packages
|     install <pkgs>        Install package(s)
|     configure <pkgs>    Configure unpacked package(s)
|     remove <pkgs|regexp>    Remove package(s)
|     flag <flag> <pkgs>    Flag package(s)
|      <flag>=hold|noprune|user|ok|installed|unpacked (one per invocation)



>

