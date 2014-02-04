Return-Path: <openembedded@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id E8B316E8FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 11:32:03 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 97434EAB7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 12:32:03 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgQdANDO8FJT4zlmPGdsb2JhbAANTINEiBKvMYhLAwEBAQE4gxkTASw9FhgDAgECATEnCAEBiAasB4VWAZx5jxKEIgSYKpVP
X-IPAS-Result: AgQdANDO8FJT4zlmPGdsb2JhbAANTINEiBKvMYhLAwEBAQE4gxkTASw9FhgDAgECATEnCAEBiAasB4VWAZx5jxKEIgSYKpVP
X-IronPort-AV: E=Sophos;i="4.95,779,1384297200"; d="scan'208";a="795864156"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 04 Feb 2014 12:32:03 +0100
Message-ID: <52F0CFB2.2040708@emagii.com>
Date: Tue, 04 Feb 2014 12:32:02 +0100
From: Ulf Samuelsson <openembedded@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Could not update ICEauthority file /var/lib/gdm/.ICEauthority
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 11:32:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I built a derivative of cloud9-gnome-image/Angstrom-1.4  for the 
Beaglebone Black on an Ubuntu 12.04 host.

When I boot, I get a popup window with the text:

"Could not update ICEauthority file /var/lib/gdm/.ICEauthority"

This appears because /var/lib/gdm is not owned by gdm.
Instead it is owned by 115:125

I manually changed the owner and rebooted, and this time I did not get 
the error message.

I tracked down why:

The recipe for gdm in 
meta-openembedded/meta-gnome/recipes-gnome/gdm_2.32.2.bb contains:


------------------------------------------------------------------------------
do_install_append() {
     ...
     chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
     chmod 0750 ${D}${localstatedir}/lib/gdm
     ...
}
------------------------------------------------------------------------------

Problem with this approach is that the chown command is using the 
user:group of the host .

If I do
<host> # cat /etc/passwd | grep gdm
I get:

gdm:x:115:125:Gnome Display Manager:/var/lib/gdm:/bin/false

If I do the same on the target I get:

root@beaglebone:~# cat /etc/passwd | grep gdm
I get:
gdm:x:997:993::/var/lib/gdm:/bin/sh

so I think that setting the user:group must be done in a postinstall task.


-- 
Best Regards
Ulf Samuelsson


