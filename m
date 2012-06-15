Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1SfYPg-00058H-Q4
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jun 2012 17:26:18 +0200
Received: by vcbfl15 with SMTP id fl15so1751160vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2012 08:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:x-gm-message-state;
	bh=rl2isA3CUedeBIjaAHBpY2SumptVcsPNtIKcFj2gFUw=;
	b=B3bfhGR2/+8EObAhjq9C5piN5i86Zg9plBXsWpHLfMd7AUr/qFASOj3ie498HdUJh3
	+3NaQH3IIb2ldj49sfQ1omlGB0b9dHlsNndbU30MoL5hvTKB0GMCQt1ph5cqCupylqdN
	QxAaIaB9NhKiJ5DD9uxax7qBHp+CdVfAGZpT6qAP6e8/VZ+G/noDUjy82zX2QCZP66oR
	GuPVdbfc7PJiTrXoeBhQLQRpU1q9DLw01kp9A2F4caL4aEw9pDCVBaugLrPmSpkLuduO
	IPRPNtbccmkn3lgPjDAjb0JRYQl6cqirixAYzvC8o06VEHftQp9610S5V7ejUPiEXUUJ
	9vGg==
MIME-Version: 1.0
Received: by 10.52.23.107 with SMTP id l11mr2656940vdf.6.1339773337667; Fri,
	15 Jun 2012 08:15:37 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.52.169.1 with HTTP; Fri, 15 Jun 2012 08:15:37 -0700 (PDT)
Date: Fri, 15 Jun 2012 11:15:37 -0400
X-Google-Sender-Auth: 4MTh0Y3vMLKR9VHja7tfgL7P0QA
Message-ID: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkDvbznXUBEwKr/Qy/b+0/Zvd+J5lvxBcA/s99Hu7oPcuI9VVACLguwzukJVZWbAxUhUaQm
Cc: openembedded-core@lists.openembedded.org
Subject: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 15 Jun 2012 15:26:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

We've been talking about this on-and-off at Wind River for a while now,
but it now seems like a reasonable time to bring a proposal to the OE
community at large.  We're thinking about creating a new layer to house
recipes, etc.  for networking packages.  I'll try to address what seem to
be the most immediate questions (certainly the ones we've been thinking
most about any time I've discussed this with anyone):

Who would use this?

   The intent is that this would be a layer generally useful directly on
   top of the Yocto Project / OE-core, but it would also draw from and
   compliment meta-oe.  Right now I'm imagining two main groups interested
   in this layer.

      - Anyone building a small networking device (eg. a home router /
        bridge / switch).

      - Anyone wanting to add network services to their device (eg.
        anything that might benefit from a small ftp/tftp server)

What will it include?

   The focus should be on networking protocols, daemons, servers and utilities.
   The plan is for a staged approach.  Initially we're going to bring forward a
   number of recipes from OE Classic that aren't currently in OE-core or the
   meta-oe layer.  The short list right now is:

      - aoetools
      - openldap
      - quagga
      - radvd
      - tftp-hpa
      - traceroute
      - tunctl
      - vblade
      - vlan
      - xl2tpd

   The next two stages would run concurrently, with Wind River
   contributing a number of recipes we intend to support for the
   long-term.  That list is still being firmed up but will include:

      - freeradius
      - netcat
      - racoon2
      - rdist

   There's about another six or seven packages on the short list right
   now, generally in the same vein.

   The other stage is migrating packages that seem like obvious fits into
   this layer from meta-oe.  The current list under consideration would
   be:

      - atftp
      - bridge-utils
      - dnsmasq
      - dnsmasq-dbus
      - inetutils
      - ipsec-tools
      - iw
      - libnet
      - libnfnetlink
      - net-snmp
      - ntp
      - ntp-ssl
      - openvpn
      - ptpd
      - rp-pppoe
      - samba
      - strongswan
      - talloc
      - tcpdump
      - vsftpd

That's a lot of stuff, are you going to organize it somehow?

   The plan is that we will have subdirectories for logical groups of
   recipes in much the same way meta-oe is organized today.  Groupings I
   would propose right now would be:

      - recipes-daemons
         - containing stuff like atftp, dnsmasq, racoon2, radvd, etc.
      - recipes-protocols
         - containing stuff like quagga, openldap, xl2tpd, maybe iscsi if it
           appears, etc.
      - recipes-support
         - containing the rest, aoetools, bridge-utils, traceroute, etc.

   This is definitely the least-clear part of our plan so far and would
   need the most feedback and fine-tuning, I expect.

Why move anything from meta-oe?

   "Networking" covers such a broad area and touches so much that it
   really seems like 'meta-networking' should be a home for all of the
   embedded networking bits.  Leaving some parts in meta-oe and having the
   rest in meta-networking would ultimately seem a bit arbitrary.

Who is 'we'?

   Wind River is volunteering to maintain the layer and any recipes we
   contribute at the outset.  For recipes imported from OE Classic it'd be
   great if the maintainers there continued ownership, but if that's not
   possible, WR will also sign up for general maintenance.  For recipes
   imported from meta-oe we would hope that the current maintainers would
   continue support in meta-networking once it's created.  WR definitely
   won't be able to do this alone so we're hoping for help from everyone
   here.

When are you doing this?

   I've been working on a prototype on and off for the last little bit but
   considering the scope and potential impact, it seemed best to open up
   the discussion here first and if it seemed like a generally desirable
   thing, we'd get some version of this up and available within a few days
   of consensus.

So what does everyone think?  Awesome idea?  Terrible idea?  (Hopefully)
something in between?  All feedback is welcome.

-- 
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind River
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283


