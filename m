Received: from qw-out-1920.google.com ([74.125.92.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NwyXD-0002zY-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 16:04:44 +0200
Received: by qw-out-1920.google.com with SMTP id 4so37740qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=I6EHHd74CjVknojfaWETI+mic7RtG9zNfO0ErrpK5as=;
	b=QljIQD7zLqgnyyMlSDgQHccfi+7hCoZC+htVJ96ysv82UEWZP+sCNZet9MhihTDeQs
	2vfvedCggkFu9/LJ5e9XzJXWMZV5xIn54Ofk9poj7dkZq5QLgfhJtZpYU3UM9iZ0eKRM
	azIv0WoRoJkeSgPqCS95azfp/+48ugnePqo8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kNccr82LRw1o1cndN6P4/sprNEasjJykvtqYai67kU7zY+r6OOtOHzkPL+IQZ+XK+7
	zNcJDin/yNg0IfoML8GWU4S6G33Yp0ZWcQvPvq3U1otdaMl1NS2WAD/qPwkZat3P5OJX
	mh2nA/Mw4SwM5rEOPrTGS4wO1h2zzboSjaJho=
MIME-Version: 1.0
Received: by 10.229.89.85 with HTTP; Wed, 31 Mar 2010 07:01:29 -0700 (PDT)
In-Reply-To: <20100331132523.31493.75635.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100331132523.31493.75635.stgit@ES-J7S4D2J.amer.consind.ge.com>
Date: Wed, 31 Mar 2010 07:01:29 -0700
Received: by 10.229.214.74 with SMTP id gz10mr1536854qcb.25.1270044089302; 
	Wed, 31 Mar 2010 07:01:29 -0700 (PDT)
Message-ID: <w2u5e088bd91003310701t15cc16c5w4075659e89068d0f@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dhcp: Correct leases directory location
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
X-List-Received-Date: Wed, 31 Mar 2010 14:04:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, 2010-03-31 at 14:29 +0100, Martyn Welch wrote:
> The DHCP client currently expects to be able to create a leases file in
> "/var/lib/dhcp" as configured in dhcp3.inc. Recipe is currently creating a
> directory called "/var/lib/dhcp3", resulting in the following error:
>
> can't create /var/lib/dhcp/dhclient.eth0.leases
>
> Correct directory naming to resolve error.
>
> Signed-off-by: Martyn Welch <martyn.welch@ge.com>
>
> ---
>
>  Steve: This seems to be directy reversing a change you made. The commit
>   message doesn't give me any idea of why you did it, can you remember?

Interesting.  I made the change because I was getting quite similar
errors, but for files being created in /var/lib/dhcp3!

I'm not sure what is different about our overall set ups, but perhaps
the proper fix is to create both directories.

Steve


>  recipes/dhcp/dhcp3.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/dhcp/dhcp3.inc b/recipes/dhcp/dhcp3.inc
> index f099003..5507f1c 100644
> --- a/recipes/dhcp/dhcp3.inc
> +++ b/recipes/dhcp/dhcp3.inc
> @@ -45,7 +45,7 @@ do_install() {
>       install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
>       install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
>       install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
> -     install -d ${D}/var/lib/dhcp3
> +     install -d ${D}/var/lib/dhcp
>  }
>
>  PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
> @@ -53,7 +53,7 @@ FILES_${PN} = ""
>  FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
>  FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
>
> -FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
> +FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp"
>
>  FILES_dhcp-omshell = "${bindir}/omshell"
>
>
>
> --
> Martyn Welch (Principal Software Engineer)   |   Registered in England and
> GE Intelligent Platforms                     |   Wales (3828642) at 100
> T +44(0)127322748                            |   Barbirolli Square, Manchester,
> E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


