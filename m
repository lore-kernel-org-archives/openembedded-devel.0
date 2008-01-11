Received: from [217.116.0.27] (helo=correo9.acens.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <joaquinduran@adtelecom.es>) id 1JDEr0-0006J7-DL
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 09:03:09 +0100
Received: (qmail 20207 invoked from network); 11 Jan 2008 07:36:10 -0000
Received: from unknown (HELO [194.179.62.51])
	(joaquinduran.adtelecom.es@[217.125.169.184])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo9.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	11 Jan 2008 07:36:10 -0000
Message-ID: <47872916.7020802@adtelecom.es>
Date: Fri, 11 Jan 2008 09:30:14 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.9 (X11/20071116)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: RFC: unify functions to check if arch has FPU or not
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
X-List-Received-Date: Fri, 11 Jan 2008 08:03:29 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hello,

There are several packages that at .bb file is checked if the
architecture includes or not a FPU to configure compilation parameters,
like gtk+, cairo, alsa.

The idea is create a function similar to the existing ones with to added
parameters: one should be returned when there is FPU in the architecture
and the other when there is no FPU.

Example:

def get_fpu_setting(bb, d, fpu, nofpu):
        if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
                return nofpu
        return fpu

get_fpu_setting(bb, d, "--enable-fpu", "--disable-fpu")


Thanks
Joaquim Duran


