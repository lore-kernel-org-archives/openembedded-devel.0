Received: from mail-qy0-f201.google.com ([209.85.221.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NzF9f-0002ot-Qt
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 22:13:48 +0200
Received: by qyk39 with SMTP id 39so337773qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Apr 2010 13:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.213.130 with HTTP; Tue, 6 Apr 2010 13:10:25 -0700 (PDT)
Date: Tue, 6 Apr 2010 13:10:25 -0700
Received: by 10.229.218.203 with SMTP id hr11mr416793qcb.85.1270584625839; 
	Tue, 06 Apr 2010 13:10:25 -0700 (PDT)
Message-ID: <i2m18e217241004061310q6d660b1eocbc99c4a923613ea@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.201
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: sdk for libraies and drivers
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
X-List-Received-Date: Tue, 06 Apr 2010 20:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

we have the need to create an SDK for our distro for some of customers.
These customers do not want the OE environment and thus will need the
following to builds their apps:

1) tarball of our base file system
2) kernel
3) Some native tools we used to create loadable images etc.
4) staging area..


Some of this is normal fare. Its quite easy to copy out the images from the
deploy images directory and to create a nativesdk for the tools using
BBCLASSEXTEND.

My question is with regard to the staging area. We don't want to just tar up
our final staging area since it will contain lots of files/api/libraries for
internal packages that we don't want the the user of this sdk to rely upon.

Is there a good way of using OE to publish select packages for a SDK? is it
just a matter of picking out select packaged staging packages?

also is there something similar to an "image" which would create an SDK for
n number of packages.

Is there a class that does this? it seems like nativesdk and crosssdk are
for compilers and native tools, but not anything specifically for target
APIs

Does anyone else do this? what were your experiences ?

Thank you
Mike

