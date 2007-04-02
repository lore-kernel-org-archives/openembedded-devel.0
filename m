Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1HYIai-0005zX-9o
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 11:12:44 +0200
Received: (qmail 22088 invoked from network); 2 Apr 2007 09:12:42 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 2 Apr 2007 09:12:42 -0000
Message-ID: <4610C901.2010306@openhardware.net>
Date: Mon, 02 Apr 2007 05:12:33 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: patch: shasum vs. sha256sum
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
X-List-Received-Date: Mon, 02 Apr 2007 09:12:46 -0000
Content-Type: multipart/mixed; boundary="------------090406070500070102000500"

--------------090406070500070102000500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Just noticed that the sha256sum has been added to the 
classes/sanity.bbclass and bitbake balked at running.   This morning I 
had installed perl-Digest::SHA to satisfy the need for 'shasum'.

I haven't found any package on Mandriva that provides 'sha256sum',  
however, adding '-a 256' sets the sha256 algorithm for shasum?  With 
these two changes, bitbake seems to build the project ok, or, am I 
missing something here?

Regards,

TomW

-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------



--------------090406070500070102000500
Content-Type: text/x-patch;
 name="base.bbclass.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="base.bbclass.patch"

--- classes/base.bbclass~	2007-04-02 01:30:14.000000000 -0400
+++ classes/base.bbclass	2007-04-02 01:32:34.000000000 -0400
@@ -54,7 +54,7 @@
         raise Exception("Executing md5sum failed")
 
     try:
-        shapipe = os.popen('shasum -a 2 -b ' + localpath)
+        shapipe = os.popen('shasum -a 256 -b ' + localpath)
         shadata = (shapipe.readline().split() or [ "" ])[0]
         shapipe.close()
     except OSError:

--------------090406070500070102000500
Content-Type: text/x-patch;
 name="sanity.bbclass.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sanity.bbclass.patch"

--- classes/sanity.bbclass~	2007-04-02 01:38:59.000000000 -0400
+++ classes/sanity.bbclass	2007-04-02 01:39:27.000000000 -0400
@@ -86,7 +86,7 @@
 	if not check_app_exists('${BUILD_PREFIX}g++', e.data):
 		missing = missing + "C++ Compiler (${BUILD_PREFIX}g++),"
 
-	required_utilities = "patch diffstat texi2html makeinfo cvs svn git bzip2 tar gzip gawk sha256sum md5sum"
+	required_utilities = "patch diffstat texi2html makeinfo cvs svn git bzip2 tar gzip gawk shasum md5sum"
 
 	for util in required_utilities.split():
 		if not check_app_exists( util, e.data ):

--------------090406070500070102000500--
