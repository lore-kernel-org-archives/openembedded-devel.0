Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1LAZI7-00035I-C5
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 01:20:31 +0100
Received: (qmail invoked by alias); 11 Dec 2008 00:16:26 -0000
Received: from BAA57ca.baa.pppool.de (EHLO [192.168.178.35]) [77.128.87.202]
	by mail.gmx.net (mp012) with SMTP; 11 Dec 2008 01:16:26 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19r2vkPATFrjnBrDd4fzh9cut6dbnVMhOCuRE6Frh
	7AD8F0HXK7fgKw
Message-ID: <49405BD7.2010801@gmx.de>
Date: Thu, 11 Dec 2008 01:16:23 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.18 (Windows/20081105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081210234910.GA16050@excalibur.local>
In-Reply-To: <20081210234910.GA16050@excalibur.local>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
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
X-List-Received-Date: Thu, 11 Dec 2008 00:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt schrieb:
> Hello.
>
> While playing to get connman 0.1 running I found that we don't ship two files in
> the wpa-supplicant that come in handy.
>
> /etc/dbus-1/system.d/dbus-wpa_supplicant.conf
>
> That one is really needed. Without it a wpa-supplicant -u barks out about wrong
> security.
>
> /usr/share/dbus-1/system-services/dbus-wpa_supplicant.service
>
> This one is a nice-to-have. It allows autostart the service with the service
> activation infrastructure from dbus. If a bus name listed in such a file is
> called and not available it gets started the way described in this file.
>
> The following patch i nstalls the files correctly for me. Never used FILES_${PN}
> before so I would like to get some review before.
>   
Maybe its better to create a package wpasupplicant-dbus. IMO we should 
try to split packages if we can and  the dbus
functionallity is clearly separable from wpasupplicant core functions.

Regards,
Thomas


