Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cazzeml@gmail.com>) id 1PKoZv-0005Ne-9i
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 09:50:19 +0100
Received: by fxm7 with SMTP id 7so1029447fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=aLvY0x/ZsXiBvZr3Sp5yldSu4NHIH2HvevediLR4ZHs=;
	b=QQgEVgj+22qy+4zR1nvx6JzHzeIhNgwswpcq3jCy1Xmi8DCefp8gF/q5xjHScEFHf5
	7EYWeMa9YwuVhWJYsICtevqyQ4RHXXGrPlZAGiseQHWqVtokLH6A7XWptzZhJHQ0Gj9i
	ZcBxNjeaiKDGD6ciQ3xerBNYjPSn2HbvPFfzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=M4t7tTLyvhmAI3b0xBerZxXddXlTnm+R552PadKDIP8TkFciv64Xwy882FmCrrOnEB
	Qdpx8QLVWfABr5EeHy0CwUPbYLl/KJOnRixixRHS4oVZrn4EjRp/xnTztOJWNc+2AIIc
	RYYPoEKBqGGh1DA24sZpiGeHrdO+18jBLPnU8=
Received: by 10.223.81.70 with SMTP id w6mr1946051fak.18.1290502146558;
	Tue, 23 Nov 2010 00:49:06 -0800 (PST)
Received: from [192.168.111.101] (d54C04D68.access.telenet.be [84.192.77.104])
	by mx.google.com with ESMTPS id e6sm1670422fav.32.2010.11.23.00.49.04
	(version=SSLv3 cipher=RC4-MD5); Tue, 23 Nov 2010 00:49:05 -0800 (PST)
Message-ID: <4CEB7FFF.7010703@gmail.com>
Date: Tue, 23 Nov 2010 09:49:03 +0100
From: Pierre Cassimans <cazzeml@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290436983.22883.5.camel@guesswho>
In-Reply-To: <1290436983.22883.5.camel@guesswho>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: cazzeml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems creating image for h2200
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
X-List-Received-Date: Tue, 23 Nov 2010 08:50:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2010 03:43 PM, Pierre Cassimans wrote:
> I try to bitbake an image for ipaq h2200 but everytime it fails with
> following error:
>
> Collected errors:
>   * check_data_file_clashes: Package udev wants to install
> file /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/udev/rules.d/50-hostap_cs.rules
>          But that file is already provided by package  *
> udev-hostap-cs-vcc-workaround
>   * opkg_install_cmd: Cannot install package task-base.
>   * resolve_conffiles: Existing
> conffile /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/device_table is different from the conffile in the new package. The new conffile will be placed at /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/device_table-opkg.
>   * check_data_file_clashes: Package udev wants to install
> file /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/udev/rules.d/50-hostap_cs.rules
>          But that file is already provided by package  *
> udev-hostap-cs-vcc-workaround
>   * opkg_install_cmd: Cannot install package udev.
>
> Only change with the master tree is the patch i previously posted about
> the udev-compat141 hack for h2200
>
> Any Idea?
>
> Cazze
>    
Ok, if found the problem but need some advice to patch it.
It was a double declaration of a file inclusion for the h2200 udev rule 
50-hostap

It is done in the machine conf by including a recipe that adds the file:

MACHINE_EXTRA_RDEPENDS = " udev-hostap-cs-vcc-workaround "

and

it is done in the different udev packages:

do_install_append_h2200() {
         install -m 0644 ${WORKDIR}/50-hostap_cs.rules         
${D}${sysconfdir}/udev/rules.d/50-hostap_cs.rules
}

Now what is the preferred way so I can patch out the other :-)


