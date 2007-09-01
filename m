Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IRT6M-0003dg-Et
	for openembedded-devel@openembedded.org; Sat, 01 Sep 2007 15:33:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l81DVLoo003872
	for <openembedded-devel@openembedded.org>;
	Sat, 1 Sep 2007 14:31:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03598-06 for <openembedded-devel@openembedded.org>;
	Sat,  1 Sep 2007 14:31:17 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l81DVFrN003863
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 1 Sep 2007 14:31:15 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
Date: Sat, 01 Sep 2007 14:31:15 +0100
Message-Id: <1188653475.5722.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH] Merging classes with poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Sep 2007 13:33:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-31 at 13:29 +0200, Koen Kooi wrote:
> ---
> classes/base.bbclass        0b7bd90cd81cad21be3a5562472533d725e69760
> +++
> classes/base.bbclass        e9e18b1810f9cae7274bc8d18014c2ef9f972911
> @@ -374,6 +374,18 @@ oe_machinstall() {
>         fi
>  }
>  
> +addtask showdata
> +do_showdata[nostamp] = "1"
> +python do_showdata() {
> +       import sys
> +       # emit variables and shell functions
> +       bb.data.emit_env(sys.__stdout__, d, True)
> +       # emit the metadata which isnt valid shell
> +       for e in d.keys():
> +           if bb.data.getVarFlag(e, 'python', d):
> +               sys.__stdout__.write("\npython %s () {\n%s}\n" % (e,
> bb.data.getVar(e, d, 1)))
> +}
> +
>  addtask listtasks
>  do_listtasks[nostamp] = "1"
>  python do_listtasks() { 

I haven't looked closely at the diff yet but the above should not be
merged back in. I removed it from OE.dev since its broken and the same
(correct) information can be obtained with "bitbake -e". I will remove
it from Poky too in due course.

Cheers,

Richard




