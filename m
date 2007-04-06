Received: from [64.233.184.232] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HZsQG-00016q-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2007 19:40:28 +0200
Received: by wr-out-0506.google.com with SMTP id 50so617240wri
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2007 10:40:27 -0700 (PDT)
Received: by 10.114.192.1 with SMTP id p1mr1316812waf.1175881227217;
	Fri, 06 Apr 2007 10:40:27 -0700 (PDT)
Received: by 10.114.191.6 with HTTP; Fri, 6 Apr 2007 10:40:27 -0700 (PDT)
Message-ID: <f96d234e0704061040w29f723e7gf20ad5fa8112b6b5@mail.gmail.com>
Date: Fri, 6 Apr 2007 13:40:27 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: module options, modprobe.conf vs modules.conf
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
X-List-Received-Date: Fri, 06 Apr 2007 17:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Two possible issues I've observed:

1) modprobe 3.2.2 seems to require that module options be located in
modprobe.conf instead of modules.conf.  /etc/modules.d/options might
be another option.  update-modules is still generating modules.conf.

2) the module options don't seem to work on the first boot.  Perhaps
the modules are being installed before the "conf" file is generated.
I need to look into this some more.

Do we want to update the "update-modules" package, or is there some
new better way to do all this?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


