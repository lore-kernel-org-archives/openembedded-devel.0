Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RKGti-0000k3-G0 for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 23:57:02 +0200
Received: by wyh5 with SMTP id 5so150690wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 14:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.207.205 with SMTP id fz13mr10683672wbb.0.1319925058748;
	Sat, 29 Oct 2011 14:50:58 -0700 (PDT)
Received: by 10.227.200.14 with HTTP; Sat, 29 Oct 2011 14:50:58 -0700 (PDT)
Date: Sat, 29 Oct 2011 16:50:58 -0500
Message-ID: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Help?
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
X-List-Received-Date: Sat, 29 Oct 2011 21:57:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

I can get bitbake to run as root but I don't let it continue as it is
not advised.

As user I get this:

Traceback (most recent call last):
  File "/home/dthomas/bitbake/bin/bitbake", line 234, in <module>
    ret = main()
  File "/home/dthomas/bitbake/bin/bitbake", line 197, in main
    server = ProcessServer(server_channel, event_queue, configuration)
  File "/home/dthomas/bitbake/lib/bb/server/process.py", line 78, in __init__
    self.cooker = BBCooker(configuration, self.register_idle_function)
  File "/home/dthomas/bitbake/lib/bb/cooker.py", line 77, in __init__
    self.parseConfigurationFiles(self.configuration.file)
  File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
parseConfigurationFiles
    bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
IOError: [Errno 1] Operation not permitted


I have tried everything. I am using Fedora 13 and have followed every
guide to the letter. It seems to be a permissions issue but where, I
have almost given up trying. As always, there is no info on the this
anywhere that is remotely useful

Any help is appreciated?

-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.

-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


