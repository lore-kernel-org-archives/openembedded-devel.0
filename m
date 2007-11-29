Received: from [64.233.184.238] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <kergoth@gmail.com>) id 1Ixmpj-0007Go-3j
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 18:05:51 +0100
Received: by wr-out-0506.google.com with SMTP id c30so1569822wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 09:02:47 -0800 (PST)
Received: by 10.143.157.10 with SMTP id j10mr1125041wfo.1196355766549;
	Thu, 29 Nov 2007 09:02:46 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Thu, 29 Nov 2007 09:02:46 -0800 (PST)
Message-ID: <b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
Date: Thu, 29 Nov 2007 10:02:46 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474ECF9A.6050603@student.utwente.nl>
MIME-Version: 1.0
References: <474EA852.7090306@whitby.id.au>
	<474ECF9A.6050603@student.utwente.nl>
X-Google-Sender-Auth: 3d75c148437de08c
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
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
X-List-Received-Date: Thu, 29 Nov 2007 17:05:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 29, 2007 7:41 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Rod Whitby schreef:
> > Some machines don't have consoles, so the only way to access them on the
> > first boot after a reflash is via the network.
> >
> > Of course, an 'auto' keyword is required for this, and netbase currently
> > has none.
> >
> > Is there any reason why at least eth0 should not have an 'auto' keyword?
> >
> > Should this be OE-wide, only for Angstrom (koen thinks eth0 and eth1
> > should be auto), or only for specific machines (in which case, does
> > anyone object to ixp4xx having auto eth0)?
>
> +1 for OE wide

Afaik, the execution of the hotplug/coldplug scripts on startup should
generate the hotplug events for the ethernet interfaces and bring them
up that way.  In debian, the hotplug scripts bring them up with ifup
--allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
interfaces to have them brought up that way.  I'm too rusty with OE to
say how we do it today, but it's not likely that auto is needed.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


