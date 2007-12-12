Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <filippo@zirak.it>) id 1J2ahY-0000ZK-7n
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 00:09:20 +0100
Received: (qmail 3635 invoked by uid 64017); 12 Dec 2007 23:02:10 -0000
Received: from 87.4.211.233 (filippo@zirak.it@87.4.211.233) by www-zirak-new
	(envelope-from <filippo@zirak.it>,
	uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(87.4.211.233):. 
	Processed in 0.893885 secs); 12 Dec 2007 23:02:10 -0000
Received: from unknown (HELO ?192.168.1.4?) (filippo@zirak.it@87.4.211.233)
	by www-zirak-new.zirak.it with SMTP; 12 Dec 2007 23:02:09 -0000
Message-ID: <47606910.9000505@zirak.it>
Date: Thu, 13 Dec 2007 00:04:48 +0100
From: Filippo Basso <filippo@zirak.it>
User-Agent: IceDove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.2.0
Subject: bash-completion for bitbake
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
X-List-Received-Date: Wed, 12 Dec 2007 23:09:22 -0000
Content-Type: multipart/mixed; boundary="------------010003080301070400080200"

--------------010003080301070400080200
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

For everybody interested,
    I'm attaching here a small bash-completion script that I'm using.
(other scripts will be sent soon)
if somebody will make any improvements, plz send to me too...

(maybe somebody else already did... but I haven't found, can be useful
to put it in the website? you OE guys see, if there is no way to put
there, I'll upload in a personal page about my work on OE...?
suggestions well accepted)

thanx,
    phy

P.S. of course, if you want to see all the recipies, it will take long,
but if you specify the first 1 or 2 characters, it's much faster!


#
# "bitbake autocompletion description"
#
# CREATED:	Filippo Basso <filippo@zirak.it> (12-DEC-2007)
# MODIFIED:
#
# Use: 
# - simply put it into your /etc/bash_completion.d/ directory...
# For help enhancing this script, see also:
# - http://www.debian-administration.org/articles/317
# - http://www.gnu.org/software/bash/manual/bashref.html#SEC112
#


_bitbake() 
{
	local cur conns prev options options1 i j A recipefile
	COMPREPLY=()

	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	options="--help --version --buildfile= --continue --force --interactive --cmd= --read= --verbose --debug --dry-run --parse-only --disable-psyco --show-versions --environment --graphviz --ignore-deps= --log-domains= --profile"
	options1="-h -b -k -f -i -c -r -v -D -n -p -d -s -e -g -I -l -P"

	# ------- Sanity checks -------
	if [[ ${BBPATH} == "" ]]
	then
		echo
		echo "variable \$BBPATH not set, please set it before launching bitbake... thanx"
		return 1
	fi

	# ------- Options completion -------
	if [[ ${cur} == -* ]]
	then
    		if [[ ${cur} == --* ]]
		then
			COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
			return 0
		else
       			COMPREPLY=( $(compgen -W "${options1}" -- ${cur}) )
        		return 0
		fi
	fi

	# ------- Recipe list autocompletion -------
	for i in `echo $BBPATH | sed s/:/\ /g` ;
	do
	        if [[ $i != "." ]]
	        then
	                for j in `echo $i/packages/*/${cur}*.bb` ;
	                do
				if [[ -f $j ]]
				then
	                        	recipefile=`basename $j`
	                        	conns="$conns \\n ${recipefile%%_*.bb}"
				fi
	                done
	        fi
	done
    	COMPREPLY=( $(compgen -W "${conns}" -- ${cur}) )
	return 0

}
complete -F _bitbake bitbake


--------------010003080301070400080200--
