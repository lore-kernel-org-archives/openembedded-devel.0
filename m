Received: from [213.173.72.1] (helo=tor.twin.at)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <patrick.steiner@a1.net>) id 1HdZS9-0005v5-Hz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2007 00:13:41 +0200
Received: from [213.173.86.202] (helo=isengard.skynet)
	by tor.twin.at with esmtp (Exim 4.63)
	(envelope-from <patrick.steiner@a1.net>) id 1HdZRk-00078O-Tq
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2007 00:13:17 +0200
Received: from tux4u.skynet (tux4u.skynet [192.168.0.31])
	by isengard.skynet (Postfix) with ESMTP id C3B6314C152
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2007 00:13:31 +0200 (CEST)
From: Patrick Steiner <patrick.steiner@a1.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2007 00:13:30 +0200
User-Agent: KMail/1.9.6
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
In-Reply-To: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200704170013.30329.patrick.steiner@a1.net>
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2007 22:13:41 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 17. April 2007 00:02:03 Koen Kooi wrote:
> Hi,
>
> Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs for
> almost all machines, which wipes /var/lib at boot, which will break bluez
> and dpkg.
>
> What would be the best way to preserve /var/lib (and maybe others) across
> boots?
i always use this:

mount -o bind /etc/bluetooth/pairing/ /var/lib/bluetooth/

 patrick (law)

>
> regards,
>
> Koen
>
> ----------------------------------------------------------------
> This message was sent using IMP, the Internet Messaging Program.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Patrick Steiner | patrick.steiner@a1.net
ICQ: 128261350
WWW: http://helmsdeep.homelinux.net/~pat
 
working on (tux4u.skynet):
Fedora Core release 6 (Zod)
GNU/Linux 2.6.20-1.2944.fc6


