Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MTCrM-0004sw-Ur
	for openembedded-devel@openembedded.org; Tue, 21 Jul 2009 12:46:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MTCdm-0002Z6-Jz
	for openembedded-devel@openembedded.org; Tue, 21 Jul 2009 10:32:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Jul 2009 10:32:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Jul 2009 10:32:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Jul 2009 12:31:59 +0200
Message-ID: <h445ev$pe3$1@ger.gmane.org>
References: <4A657D58.4070404@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <4A657D58.4070404@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 10:46:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-07-09 10:33, Ulf Samuelsson wrote:

> diff -urN a/configure b/configure
> --- a/configure    2009-07-21 10:02:37.000000000 +0200
> +++ b/configure    2009-07-21 10:06:27.000000000 +0200
> @@ -2791,7 +2791,7 @@
>
>   glib_module="glib-2.0>= 2.10.0 gobject-2.0>  2.10.0 dbus-glib-1>= 0.61"
>   dbus_module="dbus-1>= 0.61"
> -blkid_module="blkid>= 1.43"
> +blkid_module="blkid>= 1.41"
>   polkit_module="polkit>= 0.5"
>
>   # libtool versioning - this applies to libhal and libhal-storage
> diff -urN a/configure.in b/configure.in
> --- a/configure.in    2009-05-10 21:43:52.000000000 +0200
> +++ b/configure.in    2009-07-21 10:06:51.000000000 +0200
> @@ -13,7 +13,7 @@
>
>   glib_module="glib-2.0>= 2.10.0 gobject-2.0>  2.10.0 dbus-glib-1>= 0.61"
>   dbus_module="dbus-1>= 0.61"
> -blkid_module="blkid>= 1.43"
> +blkid_module="blkid>= 1.41"
>   polkit_module="polkit>= 0.5"
>
>   # libtool versioning - this applies to libhal and libhal-storage
>
>
> Comments?

configure gets generated from configure.in, so you only have to patch 
one file. And please use git-format-patch to make a single patch next time.

Anyway, I solved it in a different way.

regards,

Koen



