Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id EB30E607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 19:55:33 +0000 (UTC)
Received: (qmail 16243 invoked by uid 1003); 2 Jul 2015 19:55:33 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.116.52)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 Jul 2015 19:55:33 -0000
Message-ID: <55959734.4010509@balister.org>
Date: Thu, 02 Jul 2015 15:55:32 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: How to create machine/customer specific ntp.conf files
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
X-List-Received-Date: Thu, 02 Jul 2015 19:55:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I'm going round and round thinking about creating custom ntp.conf files.

The existing recipe includes an ntp.conf file. My question is what is
the best way to replace the on from the recipe with a machine specific
config.

There are a couple of config issues:

1) hardware may want to sync with an on board gps
2) A vendor may want to use their own ntp servers.

Obviously, these need to apply only to specific machines and not all
builds from the same set of layers.

Any ideas how to do this without making the entire ntp package machine
specific?

Should we split the conf file into a separate recipe, sort of like gpsd?

Philip


