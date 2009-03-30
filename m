Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jjackson@vortech.net>) id 1Lo9nC-0007Ug-GT
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 07:12:14 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1297037qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 22:10:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.73.136 with SMTP id q8mr1565928qcj.28.1238389810273; Sun, 
	29 Mar 2009 22:10:10 -0700 (PDT)
Date: Mon, 30 Mar 2009 01:10:10 -0400
Message-ID: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
From: Joshua Jackson <jjackson@vortech.net>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Addition of the Coyote Linux distro and HAProxy
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
X-List-Received-Date: Mon, 30 Mar 2009 05:12:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have decided to use OE as the base for the next release of a 10 year old
distribution named "Coyote Linux". After a couple weeks of tinkering and
waiting many, long hours for compiles to either succeed or fail - I have put
together my first patch.

The attached patch adds a distribution config for Coyote Linux v4 and adds
the HAProxy recipe. This is my first submission to the project so please let
me know if there is anything I need to change about the supplied patch or
any other process I should be following.
Note - this will not compile until the tinylogin problem is fixed. For local
testing, I replaced the login manager selection in the base image class with
"busybox" instead of "tinylogin".  Tinylogin will work perfectly once the
recipe is updated to download and build the source.

As I am working on this project full time at the moment, I will be
submitting regular updates to the distribution config and adding new recipes
for needed applications.

The file is a standard, unified diff against the vanilla OE tree (pulled
just before this email as sent).

Coyote Linux distro information is available on the web site
http://www.coyotelinux.com

--
Joshua Jackson
Vortech Consulting, LLC

