Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bkaindl@gmail.com>) id 1NBu2u-0000dn-Tn
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 18:46:56 +0100
Received: by fxm1 with SMTP id 1so4373812fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 09:45:26 -0800 (PST)
Received: by 10.86.186.24 with SMTP id j24mr862972fgf.29.1258825526393;
	Sat, 21 Nov 2009 09:45:26 -0800 (PST)
Received: from ?10.0.0.1? (188-23-190-101.adsl.highway.telekom.at
	[188.23.190.101])
	by mx.google.com with ESMTPS id 3sm2619690fge.20.2009.11.21.09.45.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Nov 2009 09:45:25 -0800 (PST)
Message-ID: <4B082733.1060504@gmx.net>
Date: Sat, 21 Nov 2009 18:45:23 +0100
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, GNUtoo@no-log.org
References: <1258782956.5424.17.camel@gnutoo-desktop>	<alpine.LFD.2.00.0911210112500.25956@localhost>
	<4B07F8F8.3060802@balister.org>
In-Reply-To: <4B07F8F8.3060802@balister.org>
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: bkaindl@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 17:46:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
    indeed, the SDL_mixer-1.2.9.tar.gz has changed on http://www.libsdl.org/projects/SDL_net/release,
so conf/checksums.ini is outdated, as it stands, and has to be updated:

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 784a092..e1aac1f 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1099,8 +1099,8 @@ md5=0b5b91015d0f3bd9597e094ba67c4d65
  sha256=a8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e0b6

  [http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz]
-md5=a9eb8750e920829ff41dbe7555850156
-sha256=557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
+md5=09eb4585f46d3527fe7fce8af8f9e591
+sha256=7216a89d92327d2f0fe03e78f3c758a52be68c29daf8e971c226f4a3191e9ec0

  [http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
  md5=e45b1048d2747480dcc65ece4130a920

Philip Balister schrieb:
> On 11/21/2009 01:15 AM, Robert P. J. Day wrote:
>> On Sat, 21 Nov 2009, GNUtoo wrote:
>>> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]
>>>
>>> NOTE: The MD5Sums did not match. Wanted:
>>> 'a9eb8750e920829ff41dbe7555850156' and Got:
>>> '09eb4585f46d3527fe7fce8af8f9e591'
>>
>>    that second checksum is, in fact, the correct one for that tarball.
>> and the sha256sum in conf/checksums.ini also doesn't match the one for
>> that tarball.  if that used to be correct, does that mean someone has
>> replaced a tarball with a different but identically-named one?



