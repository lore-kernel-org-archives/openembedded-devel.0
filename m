Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LXz8S-0000aA-QM
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 15:35:20 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LXz73-0008mV-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 17:33:53 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 17:33:44 +0300
User-Agent: KMail/1.9.9
References: <200902121727.21796.roman@khimov.ru> <gn1j5m$qc5$2@ger.gmane.org>
	<200902130952.52664.roman@khimov.ru>
In-Reply-To: <200902130952.52664.roman@khimov.ru>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902131733.44801.khimov@altell.ru>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Fri, 13 Feb 2009 14:35:21 -0000
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Roman I Khimov:
> Another approach could be just reducing the race window, fixing
> create-icecc-env.sh to write to temporary file and then move it to its
> place. Maybe that would be enough.

BTW, this kind of kludge seems to be working, at least for two runs on 
dual-core and quad-core machines.

--- a/create-icecc-env.sh
+++ b/create-icecc-env.sh
@@ -181,12 +181,14 @@ else
  fi
 
 fi
+TEMPFILE=`tempfile`
 cd $tempdir
-tar -czhf "$mydir/$archive_name".tar.gz $target_files || {
+tar -czhf $TEMPFILE $target_files || {
  if test -z "$silent"; then
   echo "Couldn't create archive"
  fi
   exit 3
 }
 cd ..
+mv $TEMPFILE "$mydir/$archive_name".tar.gz
 rm -rf $tempdir


