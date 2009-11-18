Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NArxy-0003Jm-0o
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 22:21:33 +0100
Received: by pxi13 with SMTP id 13so1045181pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Z2XND2E2jhVzLkpRMDl0EJUXqmz4TnVpjyqZG+baxlk=;
	b=bTesX4L+dPCrBXo9mL8A1T9dxMSbbt+vMN6QoHVyUWG4cMmExIqfSh/LVzcvKtHogX
	t8WOxJzSXdlUjy26TMcS4uFOdfMc1dKxVsToL5IDDflxfOOxJWWCJvGkBYCrrU4SJdQq
	0A8nxoWcCjArHdRjwN1cGTxyeWsrrSq2UntHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=p2oBkGRRTz0xEpfT79+jvZRe898qYLg9xDHIJTJE35Zil18fc3tcvPqblXbSaKohGW
	0EzDiR7w3yUrwb5uqBIBYDa1z0e7gvkve8A6PY7HuTBifU7PxcdEPrh797C/gp0r4rcF
	fsRA+vBEN7IVTHvIKPcRxm7eaphGUEIUvnShQ=
MIME-Version: 1.0
Received: by 10.142.7.10 with SMTP id 10mr1281905wfg.137.1258579205007; Wed, 
	18 Nov 2009 13:20:05 -0800 (PST)
In-Reply-To: <4B03CDD9.1010202@SSpaeth.de>
References: <4B03CBF0.5010000@SSpaeth.de> <4B03CDD9.1010202@SSpaeth.de>
Date: Thu, 19 Nov 2009 07:50:04 +1030
Message-ID: <6ec4247d0911181320o1aae5e21o2f6a8038daff6173@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: BAD_RECOMMENDATIONS is broken (opkg issue)
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
X-List-Received-Date: Wed, 18 Nov 2009 21:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/18 Sebastian Spaeth <Sebastian@sspaeth.de>:
> additional: as this is an opkg issue, I am using opkg-native r240.
>
> Graham, is this supposed to work?
>
> Thanks,
> Spaetz
>

A quick look at the relevant code for this indicates to me that it may
work under certain circumstances. Its non trivial to determine how
this all interacts from code inspection alone. I'll play with it for a
bit and let you know what I come up with.


-Graham


