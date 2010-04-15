Received: from dsl027-183-242.sfo1.dsl.speakeasy.net ([216.27.183.242]
	helo=mail.qvxlabs.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <afalls@qvxlabs.com>) id 1O2JqL-0000ZK-BQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:50:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.qvxlabs.com (Postfix) with SMTP id 8ABE2740002
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 00:18:53 -0700 (PDT)
Received: from earth.localnet (unknown [10.1.1.34])
	by mail.qvxlabs.com (Postfix) with ESMTP id 416CC740001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 00:18:53 -0700 (PDT)
From: Ardavon Falls <afalls@qvxlabs.com>
Organization: QVXLabs Inc
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 00:18:52 -0700
User-Agent: KMail/1.12.4 (Linux/2.6.31-20-generic; KDE/4.3.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201004150018.52834.afalls@qvxlabs.com>
X-DSPAM-Result: Whitelisted
X-DSPAM-Processed: Thu Apr 15 00:18:53 2010
X-DSPAM-Confidence: 0.9922
X-DSPAM-Probability: 0.0000
X-DSPAM-Signature: 4bc6bddd15588352911731
X-SA-Exim-Connect-IP: 216.27.183.242
X-SA-Exim-Mail-From: afalls@qvxlabs.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Using patchfiles with bitbake
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
X-List-Received-Date: Thu, 15 Apr 2010 07:50:35 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Every time I try and add my own patchfiles to a bitbake recipe it fails with 
the following error...

No file to patch.  Skipping patch.                                                                                                                           
3 out of 3 hunks ignored                                                                                                                                     
Patch unifdef-native_2.6.18.patch does not apply (enforce with -f)                                                                                           
ERROR: Printing the environment of the function                                                                                                              
ERROR: Error in executing:                                                                                                                                   
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1  
Output:                                                                           
Applying patch unifdef-native_2.6.18.patch                                           

I'm creating the patch with the following command line

diff -crB unifdef.c.orig unifdef.c > unifdef-native_2.6.18.patch

and the patch file looks like

*** unifdef.c.orig	2010-04-14 23:19:41.824235628 -0700
--- unifdef.c	2010-04-14 23:20:53.874235836 -0700
***************
*** 206,212 ****
  static void             error(const char *);
  static int              findsym(const char *);
  static void             flushline(bool);
! static Linetype         getline(void);
  static Linetype         ifeval(const char **);
  static void             ignoreoff(void);
  static void             ignoreon(void);
--- 206,212 ----
  static void             error(const char *);
  static int              findsym(const char *);
  static void             flushline(bool);
! static Linetype         retrieveline(void);
  static Linetype         ifeval(const char **);
  static void             ignoreoff(void);
  static void             ignoreon(void);
***************
*** 512,518 ****
  
  	for (;;) {
  		linenum++;
! 		lineval = getline();
  		trans_table[ifstate[depth]][lineval]();
  		debug("process %s -> %s depth %d",
  		    linetype_name[lineval],
--- 512,518 ----
  
  	for (;;) {
  		linenum++;
! 		lineval = retrieveline();
  		trans_table[ifstate[depth]][lineval]();
  		debug("process %s -> %s depth %d",
  		    linetype_name[lineval],
***************
*** 526,532 ****
   * help from skipcomment().
   */
  static Linetype
! getline(void)
  {
  	const char *cp;
  	int cursym;
--- 526,532 ----
   * help from skipcomment().
   */
  static Linetype
! retrieveline(void)
  {
  	const char *cp;
  	int cursym;


Why is this happening &how can I fix it?

Thanks

Ardy

!DSPAM:4bc6bddd15588352911731!




