Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1HEnsb-0007AY-7w
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Feb 2007 15:34:37 +0100
Received: by wx-out-0506.google.com with SMTP id t14so209207wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2007 06:34:36 -0800 (PST)
Received: by 10.78.203.13 with SMTP id a13mr22077hug.1170858858736;
	Wed, 07 Feb 2007 06:34:18 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Wed, 7 Feb 2007 06:34:18 -0800 (PST)
Message-ID: <d46153c40702070634v59c02b26u89276d4a2df0007b@mail.gmail.com>
Date: Wed, 7 Feb 2007 08:34:18 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45C8E767.9000506@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <d46153c40702060903l5dab58b4ha7a237730d51da66@mail.gmail.com>
	<45C8B9C8.3010706@dominion.kabel.utwente.nl>
	<d46153c40702061222r3567dcecr2f1166ec6ac17128@mail.gmail.com>
	<45C8E767.9000506@dominion.kabel.utwente.nl>
Subject: Re: GNU Classpath, gconf-dbus inconsistency
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
X-List-Received-Date: Wed, 07 Feb 2007 14:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> It's located here: http://developer.imendio.com/projects/misc/gconf-dbus, but still 2.6.x.x

Does this version even work with dbus 1.x?  I just tried to run
gconftool-2 on my target system and I'm getting:

$ gconftool-2 -R /apps
(process:5130): GConf-WARNING **: Client failed to connect to the D-BUS daemon:
Failed to execute dbus-launch to autolaunch D-Bus session

(process:5130): GConf-WARNING **: Client failed to connect to the D-BUS daemon:
Failed to execute dbus-launch to autolaunch D-Bus session
Failure listing entries in `/apps': No D-BUS daemon running


But dbus-daemon is running and dbus-launch seems to work:

$ dbus-launch
DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/dbus-UrHL5MiZOc,guid=c32ef74496031f67cd2b64003b232bd3
DBUS_SESSION_BUS_PID=5323

I really don't know much about dbus or gconf so there is a good chance
that I'm just missing something here.

Andrew


