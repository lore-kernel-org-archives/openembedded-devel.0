Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LAloW-0002Jx-NA
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 14:42:48 +0100
Received: by ey-out-1920.google.com with SMTP id 4so143928eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 05:38:43 -0800 (PST)
Received: by 10.210.104.20 with SMTP id b20mr3196014ebc.123.1229002723431;
	Thu, 11 Dec 2008 05:38:43 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id f13sm965718gvd.8.2008.12.11.05.38.41
	(version=SSLv3 cipher=RC4-MD5); Thu, 11 Dec 2008 05:38:42 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081211132221.GA9378@excalibur.local>
References: <20081210234910.GA16050@excalibur.local>
	<49405BD7.2010801@gmx.de> <ghqjue$4fe$1@ger.gmane.org>
	<d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
	<20081211132221.GA9378@excalibur.local>
Date: Thu, 11 Dec 2008 13:38:40 +0000
Message-Id: <1229002720.7018.0.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.2 
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 13:42:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-12-11 at 14:22 +0100, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2008-12-11 at 10:37, Andrea Adami wrote:
> > About connman, last time I built it I noticed it depends on
> > 'resolvconf' which depends on 'bash'.
> > 
> > Is it right?
> 
> I don't remember if it was resolvconf or if it was dhclient, but one of it
> pulled in bash. This may indeed be worth trying out the alternative Koen pointed
> out.
> 
dhclient certainly used to use a script full of bashisms called when the
IP address is discovered. I had fun patching that one for NetworkManager

Graeme




