Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mdpoole@troilus.org>) id 1PlRgc-00088z-DA
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 20:51:18 +0100
Received: from source ([209.85.215.174]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTUxYfaVR0P0v7XaT6eW/XglyNEJg0UX1@postini.com;
	Fri, 04 Feb 2011 11:50:22 PST
Received: by mail-ey0-f174.google.com with SMTP id 27so1453925eye.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 11:50:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.213.4 with SMTP id p4mr4424139muq.101.1296847674986; Fri,
	04 Feb 2011 11:27:54 -0800 (PST)
Received: by 10.103.241.2 with HTTP; Fri, 4 Feb 2011 11:27:54 -0800 (PST)
Date: Fri, 4 Feb 2011 14:27:54 -0500
Message-ID: <AANLkTinrmZzz8L=1CY9=F9Rdcc4A9+-tK07VD2fA0bRG@mail.gmail.com>
From: Michael Poole <mdpoole@troilus.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Build problem when generating a squashfs image for a uclibc target
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
X-List-Received-Date: Fri, 04 Feb 2011 19:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

org.openembedded.dev/recipes/udev/attr_2.4.44.bb contains this line:
  LDFLAGS_append_libc-uclibc += " -lintl"

When generating a squashfs image, the build process apparently needs
attr-native (-2.4.44-r4 on my machine).

My (Ubuntu x86_64) host machine doesn't have a libintl.so anywhere, or
any obvious package to install it, and the line suggests that it is
only meant to be added for uclibc builds.

What is the best way to fix or work around this?

Michael Poole


